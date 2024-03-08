import 'package:call_taxi_app/controller/add_booking_provider.dart';
import 'package:call_taxi_app/controller/ui_providers/booking_provider.dart';
import 'package:call_taxi_app/models/bookings_model/bookings_model.dart';
import 'package:call_taxi_app/view/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddUserData extends StatelessWidget {
  final String carName;
  final String carModel;
  final String carRent;
  final String carCeat;
  final String image;
  AddUserData(
      {super.key,
      required this.carName,
      required this.carModel,
      required this.carRent,
      required this.carCeat,
      required this.image});
  Color mainColor = const Color.fromARGB(198, 7, 22, 153);

  BorderRadius tff = BorderRadius.circular(30);

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<AddBookingController>(context, listen: false);
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
                                image: AssetImage(image.isNotEmpty
                                    ? image
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
                              Text(carName,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900)),
                              Text(carModel,
                                  style: TextStyle(
                                      color: mainColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900)),
                              Row(children: [
                                Text('$carRent\$',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: mainColor)),
                                const Text('/per day',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(218, 117, 114, 114),
                                        fontSize: 10))
                              ])
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
                  ]))),
              Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: SizedBox(
                      child: Form(
                          key: pro.formKey,
                          child: Column(children: [
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: pro.nameController,
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
                                controller: pro.placeController,
                                decoration: InputDecoration(
                                    label: const Text('Enter Place'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff))),
                            const SizedBox(height: 15),
                            TextFormField(
                                onTap: () {
                                  pro.selectStartingDate(context);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Enter text';
                                  } else {
                                    return null;
                                  }
                                },
                                controller: pro.startingDateController,
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
                                  pro.selectEndingDate(context);
                                },
                                controller: pro.endingDateController,
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
                                controller: pro.lisenceController,
                                decoration: InputDecoration(
                                    label: const Text('Lisence No.'),
                                    border:
                                        OutlineInputBorder(borderRadius: tff)))
                          ])))),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(mainColor)),
                  onPressed: () {
                    if (pro.formKey.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (ctx1) => AlertDialog(
                                  content: Text('Confirm your Booking',
                                      style: TextStyle(
                                          color: mainColor,
                                          fontWeight: FontWeight.bold)),
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
                                          addDetails(context);
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

  void addDetails(context) async {
    final bookingProvider =
        Provider.of<BookingController>(context, listen: false);
    final bProvider = Provider.of<AddBookingController>(context, listen: false);
    final name = bProvider.nameController.text;
    final sDate = bProvider.startingDateController.text;
    final eDate = bProvider.endingDateController.text;
    final lisence = bProvider.lisenceController.text;
    final a = BookingsModel(
        name: name,
        rentEDate: eDate,
        lisence: lisence,
        rentDate: sDate,
        carName: carName,
        carModel: carModel,
        carRent: carRent,
        carImage: image);
    bookingProvider.addBooking(a);
  }
}
