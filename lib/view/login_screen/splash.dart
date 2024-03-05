import 'package:call_taxi_app/main.dart';
import 'package:call_taxi_app/view/widgets/bottom_nav.dart';
import 'package:call_taxi_app/view/login_screen/login_page.dart';
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
    check();
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
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (ctx) => LogIn(),
    ));
  }

  Future<void> check() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return LogIn();
      }));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const Home();
      }));
    }
  }
}
