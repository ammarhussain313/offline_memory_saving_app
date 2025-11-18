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
    return MemoriesModel();
  }

  @override
  void write(BinaryWriter writer, MemoriesModel obj) {
    writer.writeByte(0);
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
