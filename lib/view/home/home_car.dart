import 'package:call_taxi_app/controller/ui_providers/car_provider.dart';
import 'package:call_taxi_app/controller/search_provider.dart';
import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:call_taxi_app/view/add_booking.dart';
import 'package:call_taxi_app/view/user/user_pages/chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeCar extends StatelessWidget {
  HomeCar({
    super.key,
  });

  final cars = [
    'assets/car-26.png',
    'assets/rolss.png',
    'assets/car-58.png',
    'assets/carr1.png',
    'assets/mercedesbenz_.png',
    'assets/car-60.png',
    'assets/bxxx.png',
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
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Provider.of<CarProvider>(context, listen: false).getAllCar();

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
                    // searchProvider.activeIndex = index;
                  }))),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                onChanged: (value) {
                  searchProvider.carSearch = value;
                  searchProvider.carSearchResult(context);
                },
                decoration: InputDecoration(
                    label: const Text('search'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ))),
      Expanded(child: Consumer2<SearchProvider, CarProvider>(
          builder: (BuildContext ctx, searchValue, carValue, child) {
        return SizedBox(
            child: searchProvider.carSearch.isNotEmpty
                ? carValue.carSearchList.isEmpty
                    ? Center(
                        child: Lottie.asset(
                        'assets/Animation - 1707716192244.json',
                      ))
                    : carListbuild(carValue.carSearchList)
                : carListbuild(carValue.carList));
        // final carlist = searchValue.cSearchedList.isNotEmpty
        //     ? searchValue.cSearchedList
        //     : carValue.carList;
        // return carListbuild(carlist, searchValue);
      }))
    ]));
  }

  Widget carListbuild(List<CarsModel> carList) {
    return carList.isEmpty
        ? SizedBox(
            child: Center(
                child: Lottie.asset(
            'assets/Animation - 1707716192244.json',
          )))
        : ListView.separated(
            itemCount: carList.length,
            itemBuilder: (ctx, index) {
              final data = carList[index];
              final rentt = int.parse(data.carRent);
              carSum.add(rentt);
              double totalCar =
                  carSum.reduce((value, element) => value + element).toDouble();
              Chart.carValue = totalCar;

              return InkWell(
                  onTap: () {
                    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
                      return AddUserData(
                          carName: data.carName,
                          carModel: data.carModel,
                          carRent: data.carRent,
                          carCeat: data.carCeatCapasity,
                          image: cars[index]);
                    }));
                  },
                  child: Row(children: [
                    const SizedBox(width: 10),
                    SizedBox(
                        width: 200,
                        height: 125,
                        child: Image(
                          // image: AssetImage(data.image ?? newCarList[index]),
                          image: AssetImage(cars[index]),
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
