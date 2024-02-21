import 'package:call_taxi_app/screens/bookings/bookingscoming.dart';

import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFFF0EEE1),
            bottom: const TabBar(tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bookings',
                      style: TextStyle(
                        color: Color.fromARGB(198, 7, 22, 153),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.bookmark_added_outlined,
                      color: Color.fromARGB(198, 7, 22, 153),
                    )
                  ],
                ),
              ),
            ]),
          ),
          body: const TabBarView(children: [
            BookingsComing(),
          ]),
        ));
  }
}
