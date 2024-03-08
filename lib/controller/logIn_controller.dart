import 'package:call_taxi_app/main.dart';
import 'package:call_taxi_app/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> checklogin(context) async {
    final username = usernameController.text;
    final password = passwordController.text;
    final sharedPref = await SharedPreferences.getInstance();
    if (username == password) {
      sharedPref.setBool(saveKeyName, true);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const Home();
      }));
      // ignore: use_build_context_synchronously
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(10),
          duration: Duration(seconds: 5),
          content: Text('Invalid username and password')));
    }
    notifyListeners();
  }
}
