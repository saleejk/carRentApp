import 'package:call_taxi_app/controller/ui_providers/bike_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController cSearchController = TextEditingController();
  TextEditingController bSearchController = TextEditingController();
  String carSearch = '';
  String bikeSearch = '';
  void carSearchResult(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    final filteredList = carProvider.carList
        .where((element) =>
            element.carName.toLowerCase().contains(carSearch.toLowerCase()))
        .toList();
    carProvider.carFilteredSearch(filteredList);
  }

  void bikeSearchResult(BuildContext context) {
    final bikeProvider = Provider.of<BikeProvider>(context, listen: false);
    final filteredList = bikeProvider.bikeList
        .where((element) =>
            element.bikeName.toLowerCase().contains(bikeSearch.toLowerCase()))
        .toList();
    bikeProvider.bikeFilteredSearch(filteredList);
  }
}
