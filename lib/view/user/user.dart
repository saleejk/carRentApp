import 'dart:io';
import 'package:call_taxi_app/controller/user_page_provider.dart';
import 'package:call_taxi_app/main.dart';
import 'package:call_taxi_app/view/login_screen/login_page.dart';
import 'package:call_taxi_app/view/user/user_pages/chart.dart';
import 'package:call_taxi_app/view/user/user_pages/custommer_support.dart';
import 'package:call_taxi_app/view/user/user_pages/subscreen/subscribe.dart';
import 'package:call_taxi_app/view/add_vehicle.dart';
import 'package:call_taxi_app/view/user/user_pages/subscreen/termsAndConditions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  File? iimage;
  @override
  Widget build(BuildContext context) {
    return Consumer<UserPageProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                          'assets/381-3817314_transparent-groups-of-people-png-user-icon-round.png'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('User ID : $username'),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              userListt("Add Vehicle", Icons.add, () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => AddCar(),
                                ));
                              }),
                              userListt('Chart', Icons.list, () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const MyPieChart(),
                                ));
                              }),
                              userListt(
                                  'Custommer Support', Icons.support_agent, () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) =>
                                        const CustommerSupport()));
                              }),
                              userListt('Terms & Conditions', Icons.file_copy,
                                  () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) =>
                                        const TermsAndConditions()));
                              }),
                              userListt('Privacy Policy',
                                  Icons.private_connectivity_outlined, () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => Subscribe()));
                              }),
                              userListt('Reset data', Icons.restore, () {
                                provider.dataClear();

                                showDialog(
                                    context: context,
                                    useSafeArea: true,
                                    builder: (context) => AlertDialog(
                                          scrollable: true,
                                          content: const Text(
                                              'Reseted Successfully'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('OK'))
                                          ],
                                        ));
                              }),
                              userListt('Logout', Icons.exit_to_app, () {
                                showDialog(
                                    context: context,
                                    builder: (ctx1) {
                                      return AlertDialog(
                                        content: const Text(
                                          'Confirm to Logout',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        198, 7, 22, 153)),
                                              )),
                                          TextButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.red)),
                                              onPressed: () {
                                                provider.logOut();
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                          builder: (ctx) =>
                                                              LogIn(),
                                                        ),
                                                        (route) => false);
                                              },
                                              child: const Text(
                                                'Yes',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      );
                                    });
                              })
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  userListt(
    String title,
    IconData? icon,
    VoidCallback function,
  ) {
    return ListTile(
        onTap: function,
        leading: Icon(
          icon,
          color: const Color.fromARGB(198, 7, 22, 153),
        ),
        title: Text(
          title,
        ));
  }
}
