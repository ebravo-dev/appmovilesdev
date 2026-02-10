// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mascota_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MascotaAdapter extends TypeAdapter<Mascota> {
  @override
  final int typeId = 0;

  @override
  Mascota read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mascota(
      id: fields[0] as String,
      nombre: fields[1] as String,
      especie: fields[2] as String,
      edad: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Mascota obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nombre)
      ..writeByte(2)
      ..write(obj.especie)
      ..writeByte(3)
      ..write(obj.edad);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MascotaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
