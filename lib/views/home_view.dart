import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memories_app/constants/image_constants.dart';
import 'package:memories_app/core/utils/app_constants.dart';
import 'package:memories_app/models/memories_model.dart';
import 'package:memories_app/view_model/boxes/boxes.dart';
import 'package:memories_app/view_model/memory_view_model.dart';
import 'package:memories_app/views/favorites/favorite_memories_view.dart';
import 'package:memories_app/views/memories/add_memory_view.dart';
import 'package:provider/provider.dart';

import '../widgets/memory_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void deleteMemory(MemoriesModel memory) async {
    memory.delete();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MemoryViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Image.asset(ImageConstants.memoriesLogo),
        ),
        actionsPadding: EdgeInsets.only(right: appPadding),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteMemoriesView()),
              );
            },
            child: Icon(Icons.star, color: Colors.deepOrange, size: 40),
          ),
        ],
      ),
      body: ValueListenableBuilder<Box<MemoriesModel>>(
        valueListenable: MemoriesBox.getMemory().listenable(),
        builder: (context, box, _) {
          final data = box.values.toList().cast<MemoriesModel>();
          return data.isEmpty
              ? Center(
                  child: Text(
                    "No Memory right now. Add your memories to go to the Flashback",
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final memoryIndex = data.length - 1 - index;
                    final memory = data[memoryIndex];

                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Delete Memory"),
                              content: Text(
                                "Are you sure you want to remove this memory?",
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        deleteMemory(memory);
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel"),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: MemoryWidget(
                        title: memory.title ?? "",
                        description: memory.description ?? "",
                        city: memory.city ?? "",
                        country: memory.country ?? "",
                        images: memory.image ?? "",
                        isLiked: memory.isLiked ?? false,
                        onTapLike: () {
                          provider.toggleLike(memory);
                        },
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMemoryView()),
          );
        },
        child: Container(
          padding: EdgeInsets.all(appPadding),
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add_box_rounded,
            color: Colors.deepOrange,
            size: MediaQuery.of(context).size.height * 0.03,
          ),
        ),
      ),
    );
  }
}
