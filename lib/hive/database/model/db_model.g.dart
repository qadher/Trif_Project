// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrifsDBAdapter extends TypeAdapter<TrifsDB> {
  @override
  final int typeId = 0;

  @override
  TrifsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrifsDB(
      id: fields[0] as int,
      type: fields[1] as String,
      image: fields[2] as String,
      title: fields[3] as String,
      desc: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TrifsDB obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrifsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
