import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class seeall1 extends StatefulWidget {
  seeall1({super.key});

  @override
  State<seeall1> createState() => _seeall1State();
}

class _seeall1State extends State<seeall1> {
  List<String> shoesimage1 = [];
  // List<String> bagimage1 = [];
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
    getImageUrl();
  }

  @override
  Future<void> getImageUrl() async {
    var storage = FirebaseStorage.instance;
    var strorageRef = storage.ref().child('Shoeimages');
  

    var list = await strorageRef.listAll();
  

    await Future.forEach(list.items, (Reference ref) async {
      var url = await ref.getDownloadURL();

      setState(() {
        shoesimage1.add(url);
        // bagimage1.add(url);
      });
    });
  }

  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            LimitedBox(
              maxHeight: 260,
              child: SafeArea(
                child: ListView.builder(
                  itemCount: shoesimage1.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Selecteditempage(),
                                ));
                          },
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Selecteditempage(),
                                  ));
                            },
                            child: Container(
                              height: 240,
                              width: 200,
                              decoration: BoxDecoration(
                                  // boxShadow: const [
                                  //   BoxShadow(blurRadius: 5, offset: Offset(1, 0))
                                  // ],
                                  color: Color.fromARGB(255, 239, 238, 238),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                            ),
                          ),
                        ),
                        Positioned(
                            child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const Selecteditempage(),
                                  ));
                            },
                            child: Container(
                                height: 160,
                                width: 180,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 250, 249, 249),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(15)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    shoesimage1[index],
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                        )),
                        Positioned(
                            top: 180,
                            left: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New Items',
                                  style: GoogleFonts.mPlus1(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                const SizedBox(width: 50),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: IconButton(
                                        onPressed: () {},       
                                        icon: const Icon(
                                          Icons.shopping_cart_checkout_outlined,
                                          color: Colors.white,
                                          size: 20,
                                        )),
                                  ),
                                )
                              ],
                            )),
                        const Positioned(
                            top: 210,
                            left: 10,
                            child: Row(
                              children: [
                                Icon(Icons.attach_money_outlined, size: 20),
                                Text(
                                  '50.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                      ]),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            LimitedBox(
              maxHeight: 260,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: axisDirectionToAxis(AxisDirection.right),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Selecteditempage(),
                              ));
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Selecteditempage(),
                                ));
                          },
                          child: Container(
                            height: 280,
                            width: 200,
                            decoration: BoxDecoration(
                                // boxShadow: const [
                                //   BoxShadow(blurRadius: 5, offset: Offset(1, 0))
                                // ],
                                color: const Color.fromARGB(255, 237, 236, 236),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                          ),
                        ),
                      ),
                      Positioned(
                          child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Selecteditempage(),
                                ));
                          },
                          child: Container(
                              height: 160,
                              width: 180,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 250, 249, 249),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '',
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                      )),
                      Positioned(
                          top: 180,
                          left: 14,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'New Items',
                                style: GoogleFonts.mPlus1(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              const SizedBox(width: 50),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.shopping_cart_checkout_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              )
                            ],
                          )),
                      const Positioned(
                          top: 210,
                          left: 10,
                          child: Row(
                            children: [
                              Icon(Icons.attach_money_outlined, size: 20),
                              Text(
                                '50.00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ]),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            LimitedBox(
              maxHeight: 260,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: axisDirectionToAxis(AxisDirection.left),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Selecteditempage(),
                              ));
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Selecteditempage(),
                                ));
                          },
                          child: Container(
                            height: 280,
                            width: 200,
                            decoration: BoxDecoration(
                                // boxShadow: const [
                                //   BoxShadow(blurRadius: 5, offset: Offset(1, 0))
                                // ],
                                color: const Color.fromARGB(255, 237, 236, 236),
                                borderRadius:
                                    BorderRadiusDirectional.circular(10)),
                          ),
                        ),
                      ),
                      Positioned(
                          child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Selecteditempage(),
                                ));
                          },
                          child: Container(
                              height: 160,
                              width: 180,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 250, 249, 249),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(15)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'asset/selectedbag.jpg',
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                      )),
                      Positioned(
                          top: 180,
                          left: 14,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'New Items',
                                style: GoogleFonts.mPlus1(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                              const SizedBox(width: 50),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.shopping_cart_checkout_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ),
                              )
                            ],
                          )),
                      const Positioned(
                          top: 210,
                          left: 10,
                          child: Row(
                            children: [
                              Icon(Icons.attach_money_outlined, size: 20),
                              Text(
                                '50.00',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
