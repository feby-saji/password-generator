// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordModelAdapter extends TypeAdapter<PasswordModel> {
  @override
  final int typeId = 1;

  @override
  PasswordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordModel(
      password: fields[2] as String,
      title: fields[0] as String,
      usernameOREmail: fields[1] as String,
      dateTime: fields[3] as DateTime,
      key: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.usernameOREmail)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
