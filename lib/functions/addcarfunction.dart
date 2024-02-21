import 'package:call_taxi_app/models/car_details/addcardetails.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<AddCarModel>> carListNotifier = ValueNotifier([]);
Future<void> addCar(AddCarModel value) async {
  final carDb = await Hive.openBox<AddCarModel>('car_db');
  await carDb.add(value);
  carListNotifier.value.add(value);
  carListNotifier.notifyListeners();
  getCarDetails();
}

Future<void> getCarDetails() async {
  final carDb = await Hive.openBox<AddCarModel>('car_db');
  carListNotifier.value.clear();
  carListNotifier.value.addAll(carDb.values);
  carListNotifier.notifyListeners();
}
