import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum DataBases { carDB, bikeDB }

class VehicleController extends ChangeNotifier {
  DataBases selectedDataBases = DataBases.carDB;
  final nameController = TextEditingController();
  final modelController = TextEditingController();
  final kmController = TextEditingController();
  final rentController = TextEditingController();
  final ceatController = TextEditingController();
  File? iimage;
  final formKey = GlobalKey<FormState>();

  Future<void> picImageFromGallery(source) async {
    final returnImage = await ImagePicker().pickImage(source: source);
    if (returnImage == null) {
      return;
    } else {
      iimage = File(returnImage.path);
    }
    notifyListeners();
  }

  void selectDb(value) {
    selectedDataBases = value!;
    notifyListeners();
  }

  void clearr() {
    iimage = null;
    notifyListeners();
  }
}
