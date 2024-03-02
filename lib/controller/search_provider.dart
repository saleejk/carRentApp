import 'package:call_taxi_app/controller/ui_providers/bike_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/car_provider.dart';
import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  List<BikesModel> bSearchedList = [];
  List<CarsModel> cSearchedList = [];
  TextEditingController bSearchController = TextEditingController();
  TextEditingController cSearchController = TextEditingController();
  int activeIndex = 0;

  void bSearch(String enterName, context) {
    final getBikeProvider = Provider.of<BikeProvider>(context, listen: false);
    if (enterName.isEmpty) {
      bSearchedList = [];
    } else {
      bSearchedList = getBikeProvider.bikeSearchList
          .where((BikesModel bike) =>
              bike.bikeName.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  bool isEmpty = false;
  void cSearch(String enterName, context) {
    final getCarProvider = Provider.of<CarProvider>(context, listen: false);
    if (enterName.isNotEmpty) {
      cSearchedList = getCarProvider.carList
          .where((element) =>
              element.carName.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    } else if (enterName.isNotEmpty && cSearchedList.isEmpty) {
      isEmpty = true;
    }
    notifyListeners();
  }
  // void cSearch(String enterName, context) {
  //   final getCarProvider = Provider.of<CarProvider>(context, listen: false);
  //   if (enterName.isEmpty) {
  //     cSearchedList = [];
  //   } else {
  //     cSearchedList = getCarProvider.carSearchList
  //         .where((CarsModel car) =>
  //             car.carName.toLowerCase().contains(enterName.toLowerCase()))
  //         .toList();
  //   }
  //   notifyListeners();
  // }
}
