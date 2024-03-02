import 'package:call_taxi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> checklogin() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final sharedPref = await SharedPreferences.getInstance();
    if (username == password) {
      sharedPref.setBool(SAVE_KEY_NAME, true);
      // ignore: use_build_context_synchronously
    } else {
      return;
    }
    notifyListeners();
  }
}
