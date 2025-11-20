// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemoriesModelAdapter extends TypeAdapter<MemoriesModel> {
  @override
  final int typeId = 0;

  @override
  MemoriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemoriesModel(
      title: fields[0] as String?,
      description: fields[1] as String?,
      country: fields[3] as String?,
      city: fields[2] as String?,
      image: fields[4] as String?,
      isLiked: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MemoriesModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.isLiked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemoriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
