import 'package:hive/hive.dart';
part 'memories_model.g.dart';

@HiveType(typeId: 0)
class MemoriesModel extends HiveObject{
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? city;
  @HiveField(3)
  String? country;
  @HiveField(4)
  String? image;

  MemoriesModel({
    this.title,
    this.description,
    this.country,
    this.city,
    this.image,
  });
}
