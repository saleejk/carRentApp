import 'package:call_taxi_app/functions/addcarfunction.dart';
import 'package:call_taxi_app/models/bike_details/addbikedetails.dart';
import 'package:call_taxi_app/models/add_userDetails/adddetailss.dart';
import 'package:call_taxi_app/models/car_details/addcardetails.dart';
import 'package:call_taxi_app/screens/loginscreens/splash.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final SAVE_KEY_NAME = 'userLogedIn';
var username = '1234';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(AddCarModelAdapter().typeId)) {
    Hive.registerAdapter(AddCarModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AddDetailsModelAdapter().typeId)) {
    Hive.registerAdapter(AddDetailsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AddBikeModelAdapter().typeId)) {
    Hive.registerAdapter(AddBikeModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Kanit'),
      home: const SplashScreen(),
    );
  }
}
