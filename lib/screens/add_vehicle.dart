import 'dart:io';
import 'package:call_taxi_app/functions/addbikefunction.dart';
import 'package:call_taxi_app/functions/addcarfunction.dart';
import 'package:call_taxi_app/models/bike_details/addbikedetails.dart';
import 'package:call_taxi_app/models/car_details/addcardetails.dart';
import 'package:call_taxi_app/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});
  @override
  State<AddCar> createState() => _AddCarState();
}

enum DataBases { carDB, bikeDB }

class _AddCarState extends State<AddCar> {
  DataBases selectedDataBases = DataBases.carDB;
  final _nameController = TextEditingController();
  final _modelController = TextEditingController();
  final _kmController = TextEditingController();
  final _rentController = TextEditingController();
  final _ceatController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? iimage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(198, 7, 22, 153)),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 20),
              CircleAvatar(
                  radius: 60,
                  backgroundImage: iimage != null
                      ? FileImage(iimage!)
                      : const AssetImage(
                              'assets/rx7-iphone-3rvtctn3gxtmp8lx.jpg')
                          as ImageProvider),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () {
                    picImageFromGallery(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.image, size: 15),
                  label: const Text(
                    'Gallery',
                    style: TextStyle(fontSize: 15),
                  )),
              const SizedBox(height: 5),
              ElevatedButton.icon(
                  onPressed: () {
                    picImageFromGallery(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt, size: 15),
                  label: const Text(
                    'Camara',
                    style: TextStyle(fontSize: 15),
                  )),
              DropdownButton<DataBases>(
                  focusColor: Colors.white,
                  value: selectedDataBases,
                  items: const [
                    DropdownMenuItem(
                      value: DataBases.carDB,
                      child: Text('Cars'),
                    ),
                    DropdownMenuItem(
                        value: DataBases.bikeDB, child: Text('Bikes'))
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedDataBases = value!;
                    });
                  }),
              Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SizedBox(
                      child: Form(
                          key: _formKey,
                          child: Column(children: [
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'null';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _nameController,
                                decoration: InputDecoration(
                                    label: const Text('Brand Name'),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            const SizedBox(height: 13),
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'null';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _modelController,
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
                                    return 'null';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _kmController,
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
                                    return 'null';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _rentController,
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
                                    return 'null';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _ceatController,
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
                    if (_formKey.currentState!.validate()) {
                      addDetails();
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

  void addDetails() {
    if (selectedDataBases == DataBases.carDB) {
      final name = _nameController.text;
      final model = _modelController.text;
      final km = _kmController.text;
      final rent = _rentController.text;
      final ceat = _ceatController.text;
      final carData = AddCarModel(
          carName: name,
          carModel: model,
          carKm: km,
          carRent: rent,
          carCeatCapasity: ceat,
          image: iimage!.path);
      addCar(carData);
    } else if (selectedDataBases == DataBases.bikeDB) {
      final name = _nameController.text;
      final model = _modelController.text;
      final km = _kmController.text;
      final rent = _rentController.text;
      final ceat = _ceatController.text;
      final bikeData = AddBikeModel(
          bikeName: name,
          bikeModel: model,
          bikeKm: km,
          bikeRent: rent,
          bikeCeatCapasity: ceat,
          image: iimage!.path);
      addBikes(bikeData);
    }
  }

  Future<void> picImageFromGallery(source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) {
      return;
    } else {
      setState(() {
        iimage = File(returnImage.path);
      });
    }
  }
}
