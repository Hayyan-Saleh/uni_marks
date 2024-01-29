// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarkAdapter extends TypeAdapter<Mark> {
  @override
  final int typeId = 1;

  @override
  Mark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mark(
      term: fields[1] as int,
      year: fields[2] as int,
      name: fields[0] as String,
      markPractical: fields[4] as int,
      markTheoritical: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mark obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.term)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.markTheoritical)
      ..writeByte(4)
      ..write(obj.markPractical);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
