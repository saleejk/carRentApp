// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarsModelAdapter extends TypeAdapter<CarsModel> {
  @override
  final int typeId = 1;

  @override
  CarsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarsModel(
      carName: fields[0] as String,
      carModel: fields[1] as String,
      carKm: fields[2] as String,
      carRent: fields[3] as String,
      carCeatCapasity: fields[4] as String,
      image: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, CarsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.carName)
      ..writeByte(1)
      ..write(obj.carModel)
      ..writeByte(2)
      ..write(obj.carKm)
      ..writeByte(3)
      ..write(obj.carRent)
      ..writeByte(4)
      ..write(obj.carCeatCapasity)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
