import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  late double totalcarvalues;
  late double totalbikevalues;
  late double totalvehiclevalues;
  late Map<String, double> datas;
  @override
  void initState() {
    super.initState();
    addvalues();
  }

  void addvalues() {
    setState(() {
      totalcarvalues = Chart.carValue;
      totalbikevalues = Chart.bikeValue;
      // late Map<String, double> datas = {
      //   'cars': totalcarvalues,
      //   'bikes': totalbikevalues,
      // };
    });
  }

  List<Color> listColors = [
    Colors.black,
    const Color.fromARGB(198, 7, 22, 153),
  ];
  @override
  Widget build(BuildContext context) {
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
