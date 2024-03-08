import 'package:call_taxi_app/controller/ui_providers/bike_provider.dart';
import 'package:call_taxi_app/controller/search_provider.dart';
import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/view/add_booking.dart';
import 'package:call_taxi_app/view/subscreens/chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeBike extends StatelessWidget {
  HomeBike({super.key});
  final bikes = [
    'assets/1655877644620.png',
    'assets/2887.png',
    'assets/1655874488890-1.png',
    'assets/bike-61.png',
    'assets/bike-60.png'
  ];
  final insidecars = [
    'assets/0x0.jpg',
    'assets/433a2af8dc20518d2c95064b2e1f4be7.jpg',
    'assets/mercedes-benz-e-class-coupe-front-medium-view-759809.jpg',
    'assets/2021985.jpg',
    'assets/add-armor-audi-rs7-side-view-02.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    Provider.of<BikeController>(context, listen: false).getAllBike();

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
                    fit: BoxFit.cover,
                  ),
                );
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
                    // provider.ofactiveIndex = index;
                  }))),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                onChanged: (value) {
                  searchProvider.bikeSearch = value;
                  searchProvider.bikeSearchResult(context);
                },
                decoration: InputDecoration(
                    label: const Text('search'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ))),
      Expanded(child: Consumer2<SearchProvider, BikeController>(
          builder: (BuildContext ctx, searchValue, bikeValue, child) {
        return SizedBox(
            child: searchValue.bikeSearch.isNotEmpty
                ? bikeValue.bikeSearchList.isEmpty
                    ? Center(
                        child: Lottie.asset(
                        'assets/Animation - 1707716192244.json',
                      ))
                    : bikeListbuild(bikeValue.bikeSearchList)
                : bikeListbuild(bikeValue.bikeList));
      }))
    ]));
  }

  Widget bikeListbuild(List<BikesModel> bikeList) {
    return bikeList.isEmpty
        ? SizedBox(
            child: Center(
                child: Lottie.asset(
            'assets/Animation - 1707716192244.json',
          )))
        : ListView.separated(
            itemCount: bikeList.length,
            itemBuilder: (ctx, index) {
              final dataa = bikeList[index];
              final rentt = int.parse(dataa.bikeRent);
              bikeSum.add(rentt);
              double totalBike = bikeSum
                  .reduce((value, element) => value + element)
                  .toDouble();
              Chart.bikeValue = totalBike;

              return InkWell(
                  onTap: () {
                    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) {
                      return AddUserData(
                          carName: dataa.bikeName,
                          carModel: dataa.bikeModel,
                          carCeat: dataa.bikeCeatCapasity,
                          carRent: dataa.bikeRent,
                          image: bikes[index]);
                    }));
                  },
                  child: Row(children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 180,
                      height: 115,
                      child:
                          Image(image: AssetImage(dataa.image ?? bikes[index])),
                      // child: Image(image: AssetImage(bikes[index])),
                    ),
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
                              size: 30, color: Color.fromARGB(198, 7, 22, 153)),
                          Text(dataa.bikeName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900)),
                          Text(dataa.bikeModel,
                              style: const TextStyle(
                                  color: Color.fromARGB(198, 7, 22, 153),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900)),
                          Row(
                            children: [
                              Text(
                                dataa.bikeRent,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromARGB(198, 7, 22, 153)),
                              ),
                              const Text('/per day',
                                  style: TextStyle(
                                      color: Color.fromARGB(218, 117, 114, 114),
                                      fontSize: 10)),
                            ],
                          ),
                          const SizedBox(height: 5)
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.people,
                                size: 30,
                                color: Color.fromARGB(198, 7, 22, 153),
                              ),
                              Text('People',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900)),
                              Text(
                                '(1-2)',
                                style: TextStyle(
                                    color: Color.fromARGB(186, 90, 87, 87),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ]))
                  ]));
            },
            separatorBuilder: (ctx, index) {
              return const Divider();
            });
  }

  List<int> bikeSum = [];
}
