import 'package:flutter/foundation.dart';
import 'package:memories_app/models/memories_model.dart';
import 'package:memories_app/view_model/boxes/boxes.dart';

class MemoryViewModel with ChangeNotifier {
  String _image = "";

  String get memoryImage => _image;


  List<MemoriesModel> get memories{
    final box = MemoriesBox.getMemory();
    return box.values.toList().cast<MemoriesModel>();
  }

  void setImage(String image) {
    _image = image;
    notifyListeners();
  }

  Future<bool> addMemory(MemoriesModel memory) async {
    final box = MemoriesBox.getMemory();
    box.add(memory);
    notifyListeners();
    return true;
  }
}
