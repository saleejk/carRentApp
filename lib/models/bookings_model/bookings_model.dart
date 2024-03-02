import 'package:hive_flutter/hive_flutter.dart';
part 'bookings_model.g.dart.dart';

@HiveType(typeId: 2)
class BookingsModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String rentEDate;
  @HiveField(2)
  final String lisence;
  @HiveField(3)
  final String rentDate;
  @HiveField(4)
  final String? carName;
  @HiveField(5)
  final String? carModel;
  @HiveField(6)
  final String? carRent;
  @HiveField(7)
  final String? carImage;

  BookingsModel(
      {required this.name,
      required this.rentEDate,
      required this.lisence,
      required this.rentDate,
      this.carName,
      this.carModel,
      this.carRent,
      this.carImage});
}
