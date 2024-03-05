import 'package:call_taxi_app/service/bike_service.dart';
import 'package:call_taxi_app/service/booking_service.dart';
import 'package:call_taxi_app/service/car_service.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../../controller/ui_providers/bike_provider.dart';
import '../../../controller/ui_providers/car_provider.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  @override
  Widget build(BuildContext context) {
    BikeService bikeservice = BikeService();
    BookingService bookService = BookingService();
    CarService carService = CarService();
    bikeservice.getBikeDetails();
    bookService.getAllBookings();
    carService.getCarDetails();
    final pro = Provider.of<BikeProvider>(context);
    final carpro = Provider.of<CarProvider>(context);
    final dbBike = pro.bikeList;
    final dbCar = carpro.carList;

    double totalA = 0;
    double totalB = 0;

    for (var element in dbBike) {
      totalA += int.parse(element.bikeRent);
    }

    for (var element in dbCar) {
      totalB += int.parse(element.carRent);
    }

    late Map<String, double> datas = {
      'cars $totalB': totalB,
      'bikes $totalA': totalA,
    };

    List<Color> listColors = [
      Colors.black,
      const Color.fromARGB(198, 7, 22, 153),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(198, 7, 22, 153),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          PieChart(
            animationDuration: const Duration(seconds: 2),
            dataMap: datas,
            colorList: listColors,
            chartType: ChartType.ring,
            ringStrokeWidth: 30,
            centerText: 'PIE CHART',
            chartLegendSpacing: 50,
            chartRadius: MediaQuery.of(context).size.width / 2,
            chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                showChartValuesOutside: true,
                showChartValues: true),
            legendOptions: const LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                legendShape: BoxShape.rectangle),
          ),
        ],
      ),
    );
  }
}

class Chart {
  static double carValue = 0;
  static double bikeValue = 0;
}
