import 'package:call_taxi_app/widgets/bookings.dart';

import 'package:call_taxi_app/widgets/screen_home.dart';
import 'package:call_taxi_app/screens/user/user.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final _screens = [const ScreenHome(), const Bookings(), const User()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: true,
            selectedItemColor: const Color.fromARGB(198, 7, 22, 153),
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book_online_outlined), label: 'Bookings'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User')
            ]));
  }
}
