import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:call_taxi_app/service/booking_service.dart';
import 'package:flutter/material.dart';

class BookingController extends ChangeNotifier {
  List<BookingsModel> bookingList = [];
  BookingService bookingservice = BookingService();

  Future getAllBooking() async {
    bookingList = await bookingservice.getAllBookings();
    notifyListeners();
  }

  Future addBooking(BookingsModel value) async {
    await bookingservice.addBooking(value);
    getAllBooking();
  }

  Future<void> deleteBooking(int index) async {
    await bookingservice.deleteDetails(index);
    await getAllBooking();
  }

  Future<void> editDetails(int index, BookingsModel value) async {
    await bookingservice.editDetails(index, value);
    await getAllBooking();
  }
}
