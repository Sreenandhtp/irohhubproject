import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/screens/selecteditems.dart';
import 'package:irohubproject/modelclass/userRepository.dart';

class bagspage extends StatefulWidget {
  const bagspage({super.key});

  @override
  State<bagspage> createState() => _bagspageState();
}

class _bagspageState extends State<bagspage> {
  final controller = UserRepository();
  var bagitems = [];
  getBagData() async {
    var res = await FirebaseFirestore.instance
        .collection("bagproducts")
        .doc("bagimages")
        .get();

    bagitems.addAll(res.data()?["bagitems"]);
    log("-------------- $bagitems");
  }

  @override
  void initState() {
    super.initState();
    getBagData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getBagData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                    itemCount: bagitems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 220,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Selecteditempage(
                                  selelctedAllitems: bagitems[index],
                                ),
                              ));
                        },
                        child: Container(
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 249, 248, 248),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 125,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 233, 232, 232),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          bagitems[index]["image"],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          bagitems[index]["name"],
                                          style: GoogleFonts.mPlus1(
                                              textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          "25%",
                                          style: GoogleFonts.mPlus1(
                                              textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 33, 77, 35),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 28,
                                      width: 28,
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: IconButton(
                                          onPressed: () {
                                            controller.saveCartItems(
                                                bagitems[index]["name"],
                                                bagitems[index]["image"],
                                                bagitems[index]["price"]
                                                    ,
                                                context);
                                          },
                                          icon: const Icon(
                                            Icons.card_travel_sharp,
                                            color: Colors.white,
                                            size: 13,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.attach_money_outlined,
                                      size: 18),
                                  Text(
                                    bagitems[index]["price"].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            );
          }),
    );
  }
}
