import 'package:hive/hive.dart';
import 'package:memories_app/models/memories_model.dart';

class MemoriesBox {
  static Box<MemoriesModel> getMemory() => Hive.box<MemoriesModel>("memories");

}