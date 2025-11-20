import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:memories_app/models/memories_model.dart';
import 'package:memories_app/view_model/boxes/boxes.dart';

class MemoryViewModel with ChangeNotifier {
  String _image = "";

  String get memoryImage => _image;

  List<MemoriesModel> get memories {
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

  List<MemoriesModel> get favoriteMemories {
    return memories.where((memory) => memory.isLiked ?? false).toList();
  }

  Future<void> toggleLike(MemoriesModel memory) async{
    try{
      final box = MemoriesBox.getMemory();
      final memoryKey = _findKeyForMemory(box, memory);
      if(memoryKey != null){
        final updatedMemory = memory.copyWith(isLiked: !(memory.isLiked ?? false));
        await box.put(memoryKey, updatedMemory);
        notifyListeners();
      }else{
        log("MEMORY NOT FOUND IN BOX");
      }
    }catch (e){
      log("ERROR OCURRED ---> ${e.toString()}");
    }
  }

  int? _findKeyForMemory(Box<MemoriesModel> box, MemoriesModel memory) {
    for (var i = 0; i < box.values.length; i++) {
      final currentMemory = box.getAt(i);
      if (currentMemory == memory) {
        return box.keyAt(i);
      }
    }
    return null;
  }

  void clearImage(){
    _image = "";
    notifyListeners();
  }

}
