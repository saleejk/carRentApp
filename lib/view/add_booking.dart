import 'package:call_taxi_app/controller/ui_providers/booking_provider.dart';
import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:call_taxi_app/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddUserData extends StatefulWidget {
  final String carName;
  final String carModel;
  final String carRent;
  final String carCeat;
  final String image;
  const AddUserData(
      {super.key,
      required this.carName,
      required this.carModel,
      required this.carRent,
      required this.carCeat,
      required this.image});
  @override
  State<AddUserData> createState() => _AddUserDataState();
}

class _AddUserDataState extends State<AddUserData> {
  final _nameController = TextEditingController();
  final _placeController = TextEditingController();
  final _startingDateController = TextEditingController();
  final _endingDateController = TextEditingController();
  final _lisenceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Color mainColor = const Color.fromARGB(198, 7, 22, 153);
  BorderRadius tff = BorderRadius.circular(30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                    child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SizedBox(
                          width: 170,
                          height: 100,
                          child: Image(
                              image: AssetImage(widget.image.isNotEmpty
                                  ? widget.image
                                  : 'assets/car-58.png')))),
                  const SizedBox(width: 10),
                  Container(
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.speed_outlined,
                                size: 30, color: mainColor),
                            Text(widget.carName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900)),
                            Text(widget.carModel,
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900)),
                            Row(children: [
                              Text('${widget.carRent}\$',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      color: mainColor)),
                              const Text('/per day',
                                  style: TextStyle(
                                      color: Color.fromARGB(218, 117, 114, 114),
                                      fontSize: 10))
                            ]),
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
                            Icon(Icons.people, size: 30, color: mainColor),
                            const Text('People',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900)),
                            const Text('(1-4)',
                                style: TextStyle(
                                    color: Color.fromARGB(186, 90, 87, 87),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900)),
                            const SizedBox(height: 5)
                          ]))
                ])),
              ),
              Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: SizedBox(
                      child: Form(
                          key: _formKey,
                          child: Column(children: [
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _nameController,
                                decoration: InputDecoration(
                                    label: const Text('Enter Name'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff))),
                            const SizedBox(height: 15),
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _placeController,
                                decoration: InputDecoration(
                                    label: const Text('Enter Place'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff))),
                            const SizedBox(height: 15),
                            TextFormField(
                                onTap: () {
                                  _selectStartingDate(context);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _startingDateController,
                                decoration: InputDecoration(
                                    label: const Text('Starting Date'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff))),
                            const SizedBox(height: 15),
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                onTap: () {
                                  _selectEndingDate(context);
                                },
                                controller: _endingDateController,
                                decoration: InputDecoration(
                                    label: const Text('Ending Date'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff))),
                            const SizedBox(height: 15),
                            TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _lisenceController,
                                decoration: InputDecoration(
                                    label: const Text('Lisence No.'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff)))
                          ])))),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(mainColor)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (ctx1) => AlertDialog(
                                  content: Text(
                                    'Confirm your Booking',
                                    style: TextStyle(
                                        color: mainColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    mainColor)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No',
                                            style: TextStyle(
                                                color: Colors.white))),
                                    TextButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    mainColor)),
                                        onPressed: () {
                                          addDetails();
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(builder: (ctx) {
                                            return const Home();
                                          }));
                                        },
                                        child: const Text('Yes',
                                            style:
                                                TextStyle(color: Colors.white)))
                                  ]));
                    }
                  },
                  icon: const Icon(Icons.directions_car_filled,
                      color: Colors.white),
                  label:
                      const Text('Go', style: TextStyle(color: Colors.white))),
              const SizedBox(height: 20)
            ])));
  }

  void addDetails() async {
    final bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    final name = _nameController.text;
    final sDate = _startingDateController.text;
    final eDate = _endingDateController.text;
    final lisence = _lisenceController.text;
    final a = BookingsModel(
        name: name,
        rentEDate: eDate,
        lisence: lisence,
        rentDate: sDate,
        carName: widget.carName,
        carModel: widget.carModel,
        carRent: widget.carRent,
        carImage: widget.image);
    bookingProvider.addBooking(a);
  }

  Future<void> _selectStartingDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
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
        lastDate: DateTime(2101));
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _endingDateController.text =
            DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }
}
