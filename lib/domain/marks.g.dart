// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarksAdapter extends TypeAdapter<Marks> {
  @override
  final int typeId = 2;

  @override
  Marks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Marks(
      marks: (fields[0] as List).cast<Mark>(),
    );
  }

  @override
  void write(BinaryWriter writer, Marks obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.marks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
