import 'package:call_taxi_app/controller/ui_providers/bike_provider.dart';
import 'package:call_taxi_app/controller/vehicle_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/car_provider.dart';
import 'package:call_taxi_app/models/bikes_model/bikes_model.dart';
import 'package:call_taxi_app/models/cars_model/cars_model.dart';
import 'package:call_taxi_app/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicleProvider =
        Provider.of<VehicleController>(context, listen: false);
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(198, 7, 22, 153)),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 20),
              Consumer<VehicleController>(builder: (context, img, child) {
                return CircleAvatar(
                    radius: 60,
                    backgroundImage: img.iimage != null
                        ? FileImage(img.iimage!)
                        : const AssetImage(
                                'assets/rx7-iphone-3rvtctn3gxtmp8lx.jpg')
                            as ImageProvider);
              }),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    vehicleProvider.picImageFromGallery(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image, size: 15),
                  label: const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 15),
                  )),
              const SizedBox(height: 5),
              ElevatedButton.icon(
                  onPressed: () {
                    vehicleProvider.picImageFromGallery(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt, size: 15),
                  label: const Text(
                    'Camera',
                    style: TextStyle(fontSize: 15),
                  )),
              Consumer<VehicleController>(builder: (context, valuee, child) {
                return DropdownButton<DataBases>(
                    focusColor: Colors.white,
                    value: valuee.selectedDataBases,
                    items: const [
                      DropdownMenuItem(
                        value: DataBases.carDB,
                        child: Text('Cars'),
                      ),
                      DropdownMenuItem(
                          value: DataBases.bikeDB, child: Text('Bikes'))
                    ],
                    onChanged: (value) {
                      valuee.selectDb(value);
                    });
              }),
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                      child: Form(
                          key: vehicleProvider.formKey,
                          child: Column(children: [
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'invalid text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: vehicleProvider.nameController,
                                decoration: InputDecoration(
                                    label: const Text('Brand Name'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            const SizedBox(height: 13),
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'invalid text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: vehicleProvider.modelController,
                                decoration: InputDecoration(
                                    label: const Text('Model'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            const SizedBox(height: 13),
                            TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'invalid text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: vehicleProvider.kmController,
                                decoration: InputDecoration(
                                    label: const Text('KM run'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            const SizedBox(height: 13),
                            TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'invalid text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: vehicleProvider.rentController,
                                decoration: InputDecoration(
                                    label: const Text('\$Rent'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            const SizedBox(height: 13),
                            TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'invalid text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: vehicleProvider.ceatController,
                                decoration: InputDecoration(
                                    label: const Text('Ceat Capasity'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))))
                          ])))),
              ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(198, 7, 22, 153))),
                  onPressed: () {
                    if (vehicleProvider.formKey.currentState!.validate()) {
                      addDetails(context);
                      vehicleProvider.clearr();
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (ctx) {
                        return const Home();
                      }));
                    }
                  },
                  icon: const Icon(Icons.directions_car_filled,
                      color: Colors.white),
                  label:
                      const Text('Add', style: TextStyle(color: Colors.white))),
              const SizedBox(height: 20)
            ])));
  }

  void addDetails(context) {
    final vehicleProvider =
        Provider.of<VehicleController>(context, listen: false);
    final bikeProvider = Provider.of<BikeController>(context, listen: false);
    final carProvider = Provider.of<CarController>(context, listen: false);
    final name = vehicleProvider.nameController.text;
    final model = vehicleProvider.modelController.text;
    final km = vehicleProvider.kmController.text;
    final rent = vehicleProvider.rentController.text;
    final ceat = vehicleProvider.ceatController.text;
    final image = vehicleProvider.iimage!.path;

    if (image.isEmpty) {
      return;
    }

    vehicleProvider.nameController.clear();
    vehicleProvider.modelController.clear();
    vehicleProvider.kmController.clear();
    vehicleProvider.rentController.clear();
    vehicleProvider.ceatController.clear();
    vehicleProvider.clearr();
    if (vehicleProvider.selectedDataBases == DataBases.carDB) {
      final carData = CarsModel(
          carName: name,
          carModel: model,
          carKm: km,
          carRent: rent,
          carCeatCapasity: ceat,
          image: image);
      carProvider.addCars(carData);
    } else if (vehicleProvider.selectedDataBases == DataBases.bikeDB) {
      final bikeData = BikesModel(
          bikeName: name,
          bikeModel: model,
          bikeKm: km,
          bikeRent: rent,
          bikeCeatCapasity: ceat,
          image: image);
      bikeProvider.addBike(bikeData);
    }
  }
}
