// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingsModelAdapter extends TypeAdapter<BookingsModel> {
  @override
  final int typeId = 2;

  @override
  BookingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookingsModel(
      name: fields[0] as String,
      rentEDate: fields[1] as String,
      lisence: fields[2] as String,
      rentDate: fields[3] as String,
      carName: fields[4] as String?,
      carModel: fields[5] as String?,
      carRent: fields[6] as String?,
      carImage: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BookingsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rentEDate)
      ..writeByte(2)
      ..write(obj.lisence)
      ..writeByte(3)
      ..write(obj.rentDate)
      ..writeByte(4)
      ..write(obj.carName)
      ..writeByte(5)
      ..write(obj.carModel)
      ..writeByte(6)
      ..write(obj.carRent)
      ..writeByte(7)
      ..write(obj.carImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
