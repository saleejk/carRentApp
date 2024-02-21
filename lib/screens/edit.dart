import 'package:call_taxi_app/functions/addtocoming.dart';
import 'package:call_taxi_app/models/add_userDetails/adddetailss.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  final String namee;
  final String datee;
  final String rentEDatee;
  final String lisencee;
  final String carnamee;
  final String carmodell;
  final String carrentt;
  final String carimagee;
  int index;
  Edit(
      {super.key,
      required this.namee,
      required this.datee,
      required this.rentEDatee,
      required this.lisencee,
      required this.carnamee,
      required this.carmodell,
      required this.carrentt,
      required this.carimagee,
      required this.index});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  void initState() {
    _nameController.text = widget.namee;
    _startingDateController.text = widget.datee;
    _endingDateController.text = widget.rentEDatee;
    _lisenceController.text = widget.lisencee;
    super.initState();
  }

  final _nameController = TextEditingController();
  final _startingDateController = TextEditingController();
  final _endingDateController = TextEditingController();
  final _lisenceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(198, 7, 22, 153)),
        body: Container(
            height: double.infinity,
            color: const Color.fromARGB(255, 246, 248, 246),
            child: SingleChildScrollView(
                child: Center(
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          const SizedBox(height: 20),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "invalid text";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      label: const Text("Name")))),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "invalid text";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {
                                    _selectStartingDate(context);
                                  },
                                  controller: _startingDateController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      label: const Text("Starting Date")))),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "invalid text";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onTap: () {
                                    _selectEndingDate(context);
                                  },
                                  controller: _endingDateController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      label: const Text("Ending Date")))),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "invalid text";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: _lisenceController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      label: const Text("Lisence")))),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                    context: context,
                                    builder: (ctx1) {
                                      return AlertDialog(
                                          content: const Text('Change Updates',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 28, 46, 179),
                                                  fontWeight: FontWeight.bold)),
                                          actions: [
                                            TextButton(
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Color.fromARGB(198,
                                                                7, 22, 153))),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            TextButton(
                                                style: const ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStatePropertyAll(
                                                            Color.fromARGB(198,
                                                                7, 22, 153))),
                                                onPressed: () {
                                                  updateChanges();
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))
                                          ]);
                                    });
                              }
                            },
                            child: const Text("Submit"),
                          )
                        ]))))));
  }

  void updateChanges() async {
    final name_ = _nameController.text;
    final sDate_ = _startingDateController.text;
    final eDate_ = _endingDateController.text;
    final lisence_ = _lisenceController.text;
    if (name_.isNotEmpty ||
        sDate_.isNotEmpty ||
        eDate_.isNotEmpty ||
        lisence_.isNotEmpty) {
      final updateData = AddDetailsModel(
        name: name_,
        rentDate: sDate_,
        rentEDate: eDate_,
        lisence: lisence_,
        carName: widget.carnamee,
        carModel: widget.carmodell,
        carRent: widget.carrentt,
        carImage: widget.carimagee,
      );
      editDetails(widget.index, updateData);
    }
    return;
  }

  Future<void> _selectStartingDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _startingDateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _selectEndingDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _endingDateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }
}
