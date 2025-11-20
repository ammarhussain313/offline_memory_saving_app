import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memories_app/models/memories_model.dart';
import 'package:memories_app/view_model/boxes/boxes.dart';
import 'package:memories_app/view_model/memory_view_model.dart';
import 'package:memories_app/widgets/memory_widget.dart';
import 'package:provider/provider.dart';

class FavoriteMemoriesView extends StatelessWidget {
  const FavoriteMemoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MemoryViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Memories", style: TextStyle(fontWeight: FontWeight.w600),), centerTitle: true,),
      body: ValueListenableBuilder(
        valueListenable: MemoriesBox.getMemory().listenable(),
        builder: (context, box, _) {
          final allMemory = box.values.toList().cast<MemoriesModel>();
          final favoriteMemories = allMemory
              .where((memory) => memory.isLiked ?? false)
              .toList();
          if (favoriteMemories.isEmpty) {
            return Center(child: Text("No Memories in Favorites right now!"));
          }
          return ListView.builder(
            itemCount: favoriteMemories.length,
            itemBuilder: (context, index) {
              return MemoryWidget(
                title: favoriteMemories[index].title ?? "",
                description: favoriteMemories[index].description ?? "",
                city: favoriteMemories[index].city ?? "",
                country: favoriteMemories[index].country ?? "",
                images: favoriteMemories[index].image ?? "",
                isLiked: favoriteMemories[index].isLiked ?? false,
                onTapLike: () {
                  provider.toggleLike(favoriteMemories[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
