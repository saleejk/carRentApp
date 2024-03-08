import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/service/bike_service.dart';
import 'package:flutter/material.dart';

class BikeController extends ChangeNotifier {
  // int activeIndex = 0;
  List<BikesModel> bikeList = [];
  List<BikesModel> bikeSearchList = [];

  BikeService bikeservice = BikeService();

  Future getAllBike() async {
    bikeList = await bikeservice.getBikeDetails();
    notifyListeners();
  }

  Future addBike(BikesModel value) async {
    await bikeservice.addBikes(value);
    getAllBike();
  }

  void bikeFilteredSearch(List<BikesModel> value) {
    bikeSearchList = value;
    notifyListeners();
  }
}
