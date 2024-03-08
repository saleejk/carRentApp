import 'package:call_taxi_app/view/home/user.dart';
import 'package:call_taxi_app/view/widgets/bookings.dart';
import 'package:call_taxi_app/view/widgets/screen_home.dart';
import 'package:flutter/material.dart';

class BottomController extends ChangeNotifier {
  final screens = [const ScreenHome(), const Bookings(), User()];
  int currentIndex = 0;
  onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
