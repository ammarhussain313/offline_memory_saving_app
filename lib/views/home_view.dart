import 'package:flutter/material.dart';
import 'package:memories_app/constants/image_constants.dart';
import 'package:memories_app/core/utils/app_constants.dart';
import 'package:memories_app/view_model/memory_view_model.dart';
import 'package:memories_app/views/memories/add_memory_view.dart';
import 'package:provider/provider.dart';

import '../widgets/memory_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      ),
      body: ListView.builder(
        itemCount: provider.myMemories.length,
        itemBuilder: (context, index) {
          return MemoryWidget(
            title: provider.myMemories[index].title ?? "",
            description: provider.myMemories[index].description ?? "",
            city: provider.myMemories[index].city ?? "",
            country: provider.myMemories[index].country ?? "",
            images: provider.myMemories[index].image ?? "",
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
