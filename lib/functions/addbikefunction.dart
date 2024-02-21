import 'package:call_taxi_app/models/bike_details/addbikedetails.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<AddBikeModel>> bikeListNotifier = ValueNotifier([]);
Future<void> addBikes(AddBikeModel value) async {
  final addbikeDb = await Hive.openBox<AddBikeModel>('addBike_db');
  await addbikeDb.add(value);
  bikeListNotifier.value.add(value);
  bikeListNotifier.notifyListeners();
}

Future<void> getBikeDetails() async {
  final addbikeDb = await Hive.openBox<AddBikeModel>('addBike_db');
  bikeListNotifier.value.clear();
  bikeListNotifier.value.addAll(addbikeDb.values);
  bikeListNotifier.notifyListeners();
}
