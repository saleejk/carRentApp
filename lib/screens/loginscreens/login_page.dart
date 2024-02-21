import 'package:call_taxi_app/main.dart';
import 'package:call_taxi_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKeyy = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(198, 7, 22, 153),
        title: const Row(
          children: [
            Text(
              'Cars',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'GaragE',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Container(
                alignment: Alignment.center,
                // width: 500,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(20),
                //   color: Color.fromARGB(255, 140, 250, 144),
                // ),
                child: Form(
                  key: formKeyy,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'null';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            label: const Text('Username'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'null';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            label: const Text('password'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(198, 7, 22, 153)),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          onPressed: () {
                            if (formKeyy.currentState!.validate()) {
                              checkLogin();
                            }
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void checkLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username == password) {
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const Home()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username password doesnt match'),
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ));
    }
  }
}
