import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CarService {
  Future addCar(CarsModel value) async {
    final carDb = await Hive.openBox<CarsModel>('car_db');
    return carDb.add(value);
  }

  Future getCarDetails() async {
    final carDb = await Hive.openBox<CarsModel>('car_db');
    return carDb.values.toList();
  }
}
