import 'package:flutter/foundation.dart';
import 'package:memories_app/models/memories_model.dart';

class MemoryViewModel with ChangeNotifier {
  String _image = "";
  List<MemoriesModel> _memories = [];

  String get memoryImage => _image;

  List<MemoriesModel> get myMemories => _memories;

  void setImage(String image) {
    _image = image;
    notifyListeners();
  }

  Future<bool> addMemory (MemoriesModel memory) async {
    myMemories.add(memory);
    notifyListeners();
    return true;
  }
}
