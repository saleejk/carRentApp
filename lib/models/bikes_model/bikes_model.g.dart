// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bikes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BikesModelAdapter extends TypeAdapter<BikesModel> {
  @override
  final int typeId = 3;

  @override
  BikesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BikesModel(
      bikeName: fields[0] as String,
      bikeModel: fields[1] as String,
      bikeKm: fields[2] as String,
      bikeRent: fields[3] as String,
      bikeCeatCapasity: fields[4] as String,
      image: fields[5] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, BikesModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bikeName)
      ..writeByte(1)
      ..write(obj.bikeModel)
      ..writeByte(2)
      ..write(obj.bikeKm)
      ..writeByte(3)
      ..write(obj.bikeRent)
      ..writeByte(4)
      ..write(obj.bikeCeatCapasity)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BikesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
