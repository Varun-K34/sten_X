// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

// ignore: camel_case_types
class signupdbAdapter extends TypeAdapter<Signupdb> {
  @override
  final int typeId = 1;

  @override
  Signupdb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Signupdb(
      id: fields[0] as String,
      username: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Signupdb obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is signupdbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
