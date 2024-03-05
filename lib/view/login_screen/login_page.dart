import 'package:call_taxi_app/controller/logIn_controller.dart';
import 'package:call_taxi_app/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final formKeyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(builder: (context, providerr, child) {
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
                          controller: providerr.usernameController,
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
                          controller: providerr.passwordController,
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
                                providerr.checklogin();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (ctx) {
                                  return const Home();
                                }));
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
    });
  }
}
