import 'package:hive/hive.dart';
part 'memories_model.g.dart';

@override
@HiveType(typeId: 0)
class MemoriesModel extends HiveObject{
  String? title;
  String? description;
  String? city;
  String? country;
  String? image;

  MemoriesModel({
    this.title,
    this.description,
    this.country,
    this.city,
    this.image,
  });
}
