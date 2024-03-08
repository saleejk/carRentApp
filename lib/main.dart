import 'package:call_taxi_app/controller/add_booking_provider.dart';
import 'package:call_taxi_app/controller/bottom_provider.dart';
import 'package:call_taxi_app/controller/edit_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/bike_provider.dart';
import 'package:call_taxi_app/controller/vehicle_provider.dart';
import 'package:call_taxi_app/controller/search_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/booking_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/car_provider.dart';
import 'package:call_taxi_app/controller/login_controller.dart';
import 'package:call_taxi_app/controller/user_page_provider.dart';
import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:call_taxi_app/view/login_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const saveKeyName = 'userLogedIn';
var username = '1234';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CarsModelAdapter().typeId)) {
    Hive.registerAdapter(CarsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(BookingsModelAdapter().typeId)) {
    Hive.registerAdapter(BookingsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(BikesModelAdapter().typeId)) {
    Hive.registerAdapter(BikesModelAdapter());
  }
  await Hive.openBox<CarsModel>('car_db');
  await Hive.openBox<BikesModel>('addBike_db');
  await Hive.openBox<BookingsModel>('booking_db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => VehicleController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => UserPageController()),
        ChangeNotifierProvider(create: (context) => CarController()),
        ChangeNotifierProvider(create: (context) => BikeController()),
        ChangeNotifierProvider(create: (context) => BookingController()),
        ChangeNotifierProvider(create: (context) => EditController()),
        ChangeNotifierProvider(create: (context) => BottomController()),
        ChangeNotifierProvider(create: (context) => AddBookingController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Kanit'),
        home: const SplashScreen(),
      ),
    );
  }
}
