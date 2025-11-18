import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memories_app/core/utils/app_constants.dart';
import 'package:memories_app/widgets/textfield.dart';

class AddMemoryView extends StatefulWidget {
  const AddMemoryView({super.key});

  @override
  State<AddMemoryView> createState() => _AddMemoryViewState();
}

class _AddMemoryViewState extends State<AddMemoryView> {
  final List<String> images = [];

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();

  final titleFocus = FocusNode();
  final descriptionFocus = FocusNode();
  final cityFocus = FocusNode();
  final countryFocus = FocusNode();

  void pickImage() async{
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: ImageSource.camera);

    if(image != null && image.path.isNotEmpty){
      //Here I have to add provider save image functionality
    }
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
                onTap: (){
                  pickImage();
                },
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.deepOrange.withValues(alpha: 0.7),
                  child: Text(
                    "Add Image",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                hintText: "Enter description",
                labelText: "Description",
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
