import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BikeService {
  Future addBikes(BikesModel value) async {
    final addbikeDb = await Hive.openBox<BikesModel>('addBike_db');
    return addbikeDb.add(value);
  }

  Future getBikeDetails() async {
    final addbikeDb = await Hive.openBox<BikesModel>('addBike_db');
    return addbikeDb.values.toList();
  }
}
