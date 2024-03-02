import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookingService {
  Future getAllBookings() async {
    final bookingDb = await Hive.openBox<BookingsModel>('booking_db');
    return bookingDb.values.toList();
  }

  Future addBooking(BookingsModel value) async {
    final bookingDb = await Hive.openBox<BookingsModel>('booking_db');
    return bookingDb.add(value);
  }

  Future deleteDetails(int index) async {
    final bookingDb = await Hive.openBox<BookingsModel>('booking_db');
    await bookingDb.deleteAt(index);
  }

  Future<void> editDetails(index, BookingsModel value) async {
    final bookingDb = await Hive.openBox<BookingsModel>('booking_db');
    await bookingDb.putAt(index, value);
  }
}
