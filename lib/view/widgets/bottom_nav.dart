import 'dart:developer';

import 'package:call_taxi_app/controller/bottom_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    log('dfghj');
    final pro = Provider.of<BottomController>(context, listen: false);
    return Scaffold(
        body: Consumer<BottomController>(
          builder: (context, value, child) => value.screens[value.currentIndex],
        ),
        // body: pro.screens[pro.currentIndex],
        bottomNavigationBar:
            Consumer<BottomController>(builder: (context, valuee, child) {
          return BottomNavigationBar(
              currentIndex: pro.currentIndex,
              showSelectedLabels: true,
              selectedItemColor: const Color.fromARGB(198, 7, 22, 153),
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                valuee.onTap(value);
                // pro.currentIndex = value;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book_online_outlined), label: 'Bookings'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
              ]);
        }));
  }
}
