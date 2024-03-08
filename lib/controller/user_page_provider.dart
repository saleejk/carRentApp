import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPageController extends ChangeNotifier {
  dataClear() {
    Hive.box<CarsModel>('car_db').clear();
    Hive.box<BookingsModel>('booking_db').clear();
    Hive.box<BikesModel>('addBike_db').clear();
    notifyListeners();
  }

  Future logOut() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();
    notifyListeners();
  }
}
