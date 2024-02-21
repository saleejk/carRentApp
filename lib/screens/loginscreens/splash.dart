import 'package:call_taxi_app/main.dart';
import 'package:call_taxi_app/widgets/bottom_nav.dart';
import 'package:call_taxi_app/screens/loginscreens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
        ),
        Image(
          image: AssetImage('assets/splash.jpg'),
          width: 450,
          height: 450,
        ),
        SizedBox(
          height: 20,
        ),
        Image(
          image: AssetImage('assets/Logo_loading.png'),
          width: 300,
          height: 30,
        )
      ],
    ));
  }

  Future<void> splashScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => const LogIn(),
    ));
  }

  Future checkUserLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      splashScreen();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => const Home(),
      ));
    }
  }
}
