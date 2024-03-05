import 'package:call_taxi_app/controller/bottom_provider.dart';
import 'package:call_taxi_app/controller/edit_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/bike_provider.dart';
import 'package:call_taxi_app/controller/vehicle_provider.dart';
import 'package:call_taxi_app/controller/search_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/booking_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/car_provider.dart';
import 'package:call_taxi_app/controller/logIn_controller.dart';
import 'package:call_taxi_app/controller/user_page_provider.dart';
import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:call_taxi_app/view/login_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

final SAVE_KEY_NAME = 'userLogedIn';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(create: (context) => VehicleProvider()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => UserPageProvider()),
        ChangeNotifierProvider(create: (context) => CarProvider()),
        ChangeNotifierProvider(create: (context) => BikeProvider()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(
          create: (context) => EditProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Kanit'),
        home: const SplashScreen(),
      ),
    );
  }
}
