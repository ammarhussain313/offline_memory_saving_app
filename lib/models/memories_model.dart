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
  @HiveField(5)
  bool? isLiked;

  MemoriesModel({
    this.title,
    this.description,
    this.country,
    this.city,
    this.image,
    this.isLiked
  });

  MemoriesModel copyWith({
    String? title,
    String? description,
    String? city,
    String? country,
    String? image,
    bool? isLiked,
}) {
    return MemoriesModel(
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      country: country ?? this.country,
      image: image ?? this.image,
      isLiked: isLiked ?? this.isLiked
    );
  }

}
