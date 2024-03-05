import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:call_taxi_app/service/car_service.dart';
import 'package:flutter/material.dart';

class CarProvider extends ChangeNotifier {
  List<CarsModel> carList = [];
  List<CarsModel> carSearchList = [];
  CarService carservice = CarService();

  Future getAllCar() async {
    carList = await carservice.getCarDetails();
    notifyListeners();
  }

  Future addCar(CarsModel value) async {
    await carservice.addCar(value);
    getAllCar();
  }

  void carFilteredSearch(List<CarsModel> value) {
    carSearchList = value;
    notifyListeners();
  }
}
