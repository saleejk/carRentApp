import 'package:hive_flutter/hive_flutter.dart';
part 'addcardetails.g.dart';

@HiveType(typeId: 1)
class AddCarModel {
  @HiveField(0)
  final String carName;
  @HiveField(1)
  final String carModel;
  @HiveField(2)
  final String carKm;
  @HiveField(3)
  final String carRent;
  @HiveField(4)
  final String carCeatCapasity;
  @HiveField(5)
  final dynamic image;

  AddCarModel(
      {required this.carName,
      required this.carModel,
      required this.carKm,
      required this.carRent,
      required this.carCeatCapasity,
      required this.image});
}
