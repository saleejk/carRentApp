import 'package:hive_flutter/hive_flutter.dart';
part 'addbikedetails.g.dart';

@HiveType(typeId: 3)
class AddBikeModel {
  @HiveField(0)
  final String bikeName;
  @HiveField(1)
  final String bikeModel;
  @HiveField(2)
  final String bikeKm;
  @HiveField(3)
  final String bikeRent;
  @HiveField(4)
  final String bikeCeatCapasity;
  @HiveField(5)
  final dynamic image;

  AddBikeModel(
      {required this.bikeName,
      required this.bikeModel,
      required this.bikeKm,
      required this.bikeRent,
      required this.bikeCeatCapasity,
      required this.image});
}
