import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/modelclass/userRepository.dart';
import 'package:irohubproject/screens/selecteditems.dart';

class seeall1 extends StatefulWidget {
  const seeall1({super.key});

  @override
  State<seeall1> createState() => _seeall1State();
}

class _seeall1State extends State<seeall1> {
  final cartcontroller = UserRepository();
  var newarraivals = [];
  var popularitems = [];
  getpopularData() async {
    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("homeitems")
        .get();

    popularitems.addAll(res.data()?["items"]);
    print("-------------- $popularitems");
  }

  getnewData() async {
    var res = await FirebaseFirestore.instance
        .collection("newarraivals")
        .doc("newarraivalimages")
        .get();

    newarraivals.addAll(res.data()?["newarraivalitems"]);
    print("-------------- $newarraivals");
    @override
    void initState() {
      super.initState();
      getpopularData();

      getnewData();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            )),
        title: const Text(
          'Popular& New Arrivels',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getpopularData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: size.width,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 20)
                      ]),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Populars",
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height / 2.7,
                      width: size.width,
                      child: GridView.builder(
                          itemCount: popularitems.length,
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
                                        selelctedAllitems: popularitems[index],
                                      ),
                                    ));
                              },
                              child: Container(
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 249, 248, 248),
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
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              child: Image.network(
                                                popularitems[index]["image"],
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
                                                popularitems[index]["name"],
                                                style: GoogleFonts.mPlus1(
                                                    textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                "50%",
                                                style: GoogleFonts.mPlus1(
                                                    textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 33, 77, 35),
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
                                                  cartcontroller.saveCartItems(
                                                      popularitems[index]
                                                          ["name"],
                                                      popularitems[index]
                                                          ["image"],
                                                      popularitems[index]
                                                          ["price"],
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
                                          popularitems[index]["price"]
                                              .toString(),
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
                    ),
                    Container(
                      height: 50,
                      width: size.width,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(blurStyle: BlurStyle.outer, blurRadius: 20)
                      ]),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "New Arraivels",
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        ),
                      ),
                    ),
                    FutureBuilder(
                        future: getnewData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Container(
                              height: size.height / 3,
                              width: size.width,
                              child: GridView.builder(
                                  itemCount: newarraivals.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisExtent: 220,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Selecteditempage(
                                                selelctedAllitems:
                                                    newarraivals[index],
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        height: 300,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 249, 248, 248),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 125,
                                                    width: 150,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 233, 232, 232),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Image.network(
                                                        newarraivals[index]
                                                            ["image"],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        newarraivals[index]
                                                            ["name"],
                                                        style:
                                                            GoogleFonts.mPlus1(
                                                                textStyle:
                                                                    const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                      ),
                                                      const SizedBox(width: 6),
                                                      Text(
                                                        "50%",
                                                        style:
                                                            GoogleFonts.mPlus1(
                                                                textStyle:
                                                                    const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255, 33, 77, 35),
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
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: IconButton(
                                                        onPressed: () {
                                                          cartcontroller
                                                              .saveCartItems(
                                                                  newarraivals[
                                                                          index]
                                                                      ["name"],
                                                                  newarraivals[
                                                                          index]
                                                                      ["image"],
                                                                  newarraivals[
                                                                          index]
                                                                      ["price"],
                                                                  context);
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .card_travel_sharp,
                                                          color: Colors.white,
                                                          size: 13,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.attach_money_outlined,
                                                    size: 18),
                                                Text(
                                                  newarraivals[index]["price"]
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
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
                            child: CircularProgressIndicator(
                                color: Colors.redAccent),
                          );
                        })
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            );
          }),
    );
  }
}
