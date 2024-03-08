import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:call_taxi_app/service/car_service.dart';
import 'package:flutter/material.dart';

class CarController extends ChangeNotifier {
  List<CarsModel> carList = [];
  List<CarsModel> carSearchList = [];
  CarService carService = CarService();

  Future addCars(CarsModel value) async {
    await carService.addCar(value);
    getAllCar();
  }

  Future getAllCar() async {
    carList = await carService.getCarDetails();
    notifyListeners();
  }

  void carFilteredSearch(List<CarsModel> searchList) {
    carSearchList = searchList;
    notifyListeners();
  }
}
