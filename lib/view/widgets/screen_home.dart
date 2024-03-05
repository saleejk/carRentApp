import 'package:call_taxi_app/view/home/home_bike.dart';
import 'package:call_taxi_app/view/home/home_car.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Auto',
                    style: TextStyle(
                        color: Color.fromARGB(198, 7, 22, 153),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    "Stop",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              ),
            ),
            backgroundColor: const Color(0xFFF0EEE1),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.directions_car_filled,
                  color: Color.fromARGB(198, 7, 22, 153),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.directions_bike,
                  color: Color.fromARGB(198, 7, 22, 153),
                ),
              )
            ]),
          ),
          body: TabBarView(children: [HomeCar(), HomeBike()]),
        ));
  }
}
