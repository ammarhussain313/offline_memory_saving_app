import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memories_app/core/utils/app_constants.dart';
import 'package:memories_app/models/memories_model.dart';
import 'package:memories_app/view_model/memory_view_model.dart';
import 'package:memories_app/widgets/textfield.dart';
import 'package:provider/provider.dart';

class AddMemoryView extends StatefulWidget {
  const AddMemoryView({super.key});

  @override
  State<AddMemoryView> createState() => _AddMemoryViewState();
}

class _AddMemoryViewState extends State<AddMemoryView> {
  late MemoryViewModel _provider;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  final titleFocus = FocusNode();
  final descriptionFocus = FocusNode();
  final cityFocus = FocusNode();
  final countryFocus = FocusNode();

  void pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null && image.path.isNotEmpty) {
      context.read<MemoryViewModel>().setImage(image.path);
    }
  }

  Future<void> saveMemory() async {
    final myMemory = MemoriesModel(
      title: titleController.text,
      description: descriptionController.text,
      city: cityController.text,
      country: countryController.text,
      image: context.read<MemoryViewModel>().memoryImage,
    );
    final isAdded = await context.read<MemoryViewModel>().addMemory(myMemory);
    if (isAdded) {
      Navigator.pop(context);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _provider = Provider.of<MemoryViewModel>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider.clearImage();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(appPadding),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Text(
                "New Memory",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                "Save your memory to revive your soul. Because memory is important for us.",
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Consumer<MemoryViewModel>(
                  builder: (context, value, child) {
                    return CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.deepOrange.withValues(alpha: 0.7),
                      backgroundImage: value.memoryImage.isNotEmpty
                          ? FileImage(File(value.memoryImage))
                          : null,
                      child: value.memoryImage.isNotEmpty
                          ? SizedBox()
                          : Text(
                              "Add Image",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: titleController,
                currentFocus: titleFocus,
                nextFocus: descriptionFocus,
                hintText: "Enter title",
                labelText: "Title",
              ),
              SizedBox(height: 12),
              CustomTextField(
                controller: descriptionController,
                currentFocus: descriptionFocus,
                nextFocus: countryFocus,
                hintText: "Enter Country",
                labelText: "Description",
              ),
              SizedBox(height: 12),
              CustomTextField(
                controller: countryController,
                currentFocus: countryFocus,
                nextFocus: cityFocus,
                hintText: "Enter country",
                labelText: "Country",
              ),
              SizedBox(height: 12),
              CustomTextField(
                controller: cityController,
                currentFocus: cityFocus,
                hintText: "Enter city",
                labelText: "City",
              ),
              SizedBox(height: 45),
              GestureDetector(
                onTap: () {
                  saveMemory();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.deepOrange.withValues(alpha: 0.7),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
