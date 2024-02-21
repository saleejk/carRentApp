import 'package:call_taxi_app/screens/add_userdata.dart';
import 'package:call_taxi_app/functions/addcarfunction.dart';

import 'package:call_taxi_app/models/car_details/addcardetails.dart';
import 'package:call_taxi_app/screens/user/chart/chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeCar extends StatefulWidget {
  const HomeCar({
    super.key,
  });

  @override
  State<HomeCar> createState() => _HomeCarState();
}

class _HomeCarState extends State<HomeCar> {
  String search = '';
  List<AddCarModel> searchedList = [];
  void searchListUpdate() {
    getCarDetails();
    searchedList = carListNotifier.value
        .where(
            (car) => car.carName.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  int activeIndex = 0;
  final cars = [
    'assets/car-26.png',
    'assets/car-58.png',
    'assets/car-60.png',
    'assets/bxxx.png',
    'assets/rolss.png',
    'assets/carr1.png',
    'assets/mercedesbenz_.png',
  ];
  final insidecars = [
    'assets/0x0.jpg',
    'assets/433a2af8dc20518d2c95064b2e1f4be7.jpg',
    'assets/mercedes-benz-e-class-coupe-front-medium-view-759809.jpg',
    'assets/2021985.jpg',
    'assets/add-armor-audi-rs7-side-view-02.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    searchListUpdate();
    return Scaffold(
        body: Column(children: [
      Container(
          alignment: Alignment.center,
          color: const Color.fromARGB(198, 7, 22, 153),
          width: double.infinity,
          child: const Text('Featured premium',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ))),
      Container(
          color: const Color.fromARGB(255, 243, 240, 217),
          child: CarouselSlider.builder(
              itemCount: insidecars.length,
              itemBuilder: (BuildContext context, index, newIndex) {
                final String imagePath = insidecars[index];
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: AssetImage(imagePath),
                      fit: BoxFit.fitWidth,
                    ));
              },
              options: CarouselOptions(
                  autoPlay: true,
                  height: 60,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }))),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    search = value;
                    searchListUpdate();
                  });
                },
                decoration: InputDecoration(
                    label: const Text('search'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ))),
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: carListNotifier,
              builder:
                  (BuildContext ctx, List<AddCarModel> carList, Widget? child) {
                if (search.isNotEmpty) {
                  if (carList.isEmpty) {
                    return SizedBox(
                        child: Center(
                            child: Lottie.asset(
                      'assets/Animation - 1707716192244.json',
                    )));
                  } else {
                    return carListbuild(searchedList);
                  }
                } else {
                  return carListbuild(carList);
                }
              }))
    ]));
  }

  Widget carListbuild(List<AddCarModel> newCarList) {
    return newCarList.isEmpty
        ? SizedBox(
            child: Center(
                child: Lottie.asset(
            'assets/Animation - 1707716192244.json',
          )))
        : ListView.separated(
            itemCount: newCarList.length,
            itemBuilder: (ctx, index) {
              final data = newCarList[index];
              final rentt = int.parse(data.carRent);
              carSum.add(rentt);
              double totalCar =
                  carSum.reduce((value, element) => value + element).toDouble();
              Chart.carValue = totalCar;

              return InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return AddUserData(
                          carName: data.carName,
                          carModel: data.carModel,
                          carRent: data.carRent,
                          carCeat: data.carCeatCapasity,
                          image: data.image);
                    }));
                  },
                  child: Row(children: [
                    const SizedBox(width: 10),
                    SizedBox(
                        width: 200,
                        height: 125,
                        child: Image(
                          image: AssetImage(data.image ?? newCarList[index]),
                        )),
                    const SizedBox(width: 30),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.speed_outlined,
                                  size: 30,
                                  color: Color.fromARGB(198, 7, 22, 153)),
                              Text(
                                data.carName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(data.carModel,
                                  style: const TextStyle(
                                      color: Color.fromARGB(198, 7, 22, 153),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900)),
                              Row(children: [
                                Text(
                                  "${data.carRent}\$",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(198, 7, 22, 153)),
                                ),
                                const Text(
                                  '/per day',
                                  style: TextStyle(
                                      color: Color.fromARGB(218, 117, 114, 114),
                                      fontSize: 10),
                                )
                              ]),
                              const SizedBox(height: 5)
                            ])),
                    const SizedBox(width: 20),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.people,
                                  size: 30,
                                  color: Color.fromARGB(198, 7, 22, 153)),
                              const Text('People',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900)),
                              Text(
                                '(1-${data.carCeatCapasity})',
                                style: const TextStyle(
                                    color: Color.fromARGB(186, 90, 87, 87),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              ),
                              const SizedBox(height: 5)
                            ]))
                  ]));
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            });
  }

  List<int> carSum = [];
}
