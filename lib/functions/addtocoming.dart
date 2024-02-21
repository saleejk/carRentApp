import 'package:call_taxi_app/models/add_userDetails/adddetailss.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<AddDetailsModel>> addBookingNotifier = ValueNotifier([]);
Future<void> addBooking(AddDetailsModel value) async {
  final bookingDb = await Hive.openBox<AddDetailsModel>('booking_db');
  await bookingDb.add(value);
  addBookingNotifier.value.add(value);
  // getDetailsAddBooking();
  addBookingNotifier.notifyListeners();
}

Future<void> getDetailsAddBooking() async {
  final bookingDb = await Hive.openBox<AddDetailsModel>('booking_db');
  addBookingNotifier.value.clear();
  addBookingNotifier.value.addAll(bookingDb.values);
  addBookingNotifier.notifyListeners();
}

Future<void> deleteDetails(int index) async {
  final bookingDb = await Hive.openBox<AddDetailsModel>('booking_db');
  await bookingDb.deleteAt(index);
  addBookingNotifier.notifyListeners();
  getDetailsAddBooking();
}

Future<void> editDetails(index, AddDetailsModel value) async {
  final bookingDb = await Hive.openBox<AddDetailsModel>('booking_db');
  addBookingNotifier.value.clear();
  addBookingNotifier.value.addAll(bookingDb.values);
  addBookingNotifier.notifyListeners();
  bookingDb.putAt(index, value);
  getDetailsAddBooking();
}
