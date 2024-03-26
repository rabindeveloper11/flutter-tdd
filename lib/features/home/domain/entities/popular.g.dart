// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularEntityAdapter extends TypeAdapter<PopularEntity> {
  @override
  final int typeId = 111;

  @override
  PopularEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularEntity(
      id: fields[0] as int,
      title: fields[1] as String,
      rating: fields[2] as double,
      isFavorite: fields[3] as bool,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PopularEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.isFavorite)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
