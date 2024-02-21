import 'package:call_taxi_app/functions/addtocoming.dart';
import 'package:call_taxi_app/models/add_userDetails/adddetailss.dart';
import 'package:call_taxi_app/screens/edit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingsComing extends StatefulWidget {
  const BookingsComing({super.key});
  @override
  State<BookingsComing> createState() => _BookingsComingState();
}

class _BookingsComingState extends State<BookingsComing> {
  Color mainColor = const Color.fromARGB(198, 7, 22, 153);
  @override
  Widget build(BuildContext context) {
    getDetailsAddBooking();
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: ValueListenableBuilder(
              valueListenable: addBookingNotifier,
              builder: (BuildContext ctx, List<AddDetailsModel> newDataList,
                  Widget? child) {
                return newDataList.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                            itemBuilder: (ctx, index) {
                              final data = newDataList[index];
                              final sDate = DateTime.parse(data.rentDate);
                              final eDate = DateTime.parse(data.rentEDate);
                              final days = eDate.difference(sDate).inDays;
                              final rent = int.parse(data.carRent!);
                              final totalDaysRent = days * rent;
                              return InkWell(
                                  onTap: () {},
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: SizedBox(
                                              width: 70,
                                              height: 50,
                                              child: Image(
                                                  image: AssetImage(
                                                      data.carImage!))),
                                        ),
                                        Container(
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(children: [
                                                    Icon(Icons.speed_outlined,
                                                        size: 18,
                                                        color: mainColor),
                                                    const SizedBox(width: 5),
                                                    Text(data.carName!,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900)),
                                                    const SizedBox(width: 3),
                                                    Text(data.carModel!,
                                                        style: TextStyle(
                                                            color: mainColor,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700))
                                                  ]),
                                                  Row(children: [
                                                    Icon(Icons.person,
                                                        size: 18,
                                                        color: mainColor),
                                                    const SizedBox(width: 5),
                                                    Text(data.name,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    const Expanded(
                                                        child: SizedBox())
                                                  ]),
                                                  const SizedBox(height: 3),
                                                  Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color:
                                                              Colors.blue[100]),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Text(
                                                                'Dated : ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900)),
                                                            Text(data.rentDate,
                                                                style: TextStyle(
                                                                    color:
                                                                        mainColor,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800))
                                                          ]))
                                                ])),
                                        Column(children: [
                                          const Text(' total Rent :',
                                              style: TextStyle(
                                                fontSize: 10,
                                              )),
                                          Row(children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: mainColor),
                                                child: const Text(" \$ ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: 18,
                                                        color: Colors.yellow))),
                                            Text("$totalDaysRent",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: mainColor))
                                          ])
                                        ]),
                                        Row(children: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (ctx) {
                                                  return Edit(
                                                      namee: data.name,
                                                      rentEDatee:
                                                          data.rentEDate,
                                                      lisencee: data.lisence,
                                                      datee: data.rentDate,
                                                      carnamee: data.carName!,
                                                      carmodell: data.carModel!,
                                                      carrentt: data.carRent!,
                                                      carimagee: data.carImage!,
                                                      index: index);
                                                }));
                                              },
                                              icon: Icon(Icons.edit,
                                                  color: Colors.grey[600])),
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (ctx1) {
                                                      return AlertDialog(
                                                          content: const Text(
                                                              'Confirm to Delete',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal)),
                                                          actions: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    'No',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color:
                                                                            mainColor))),
                                                            TextButton(
                                                                style: const ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStatePropertyAll(Colors
                                                                            .red)),
                                                                onPressed: () {
                                                                  deleteDetails(
                                                                      index);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: const Text(
                                                                    'Yes',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)))
                                                          ]);
                                                    });
                                              },
                                              icon: const Icon(Icons.delete,
                                                  color: Colors.red))
                                        ])
                                      ]));
                            },
                            separatorBuilder: (ctx, index) {
                              return const Divider();
                            },
                            itemCount: newDataList.length))
                    : SizedBox(
                        child: Center(
                            child: Lottie.asset(
                                'assets/Animation - 1707716192244.json')));
              }))
    ]));
  }
}
