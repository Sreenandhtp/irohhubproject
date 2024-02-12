import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/screens/selecteditems.dart';
import 'package:irohubproject/variables/sharedpref.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  var size, height, width;
  bool? ischecked = false;

  // List<int> quantities = [1, 1, 1, 1, 1, 1];
  // List<double> prices = [10.0, 15.0, 20.0, 10.0, 10.0];

  // void incrementQuantity(int index) {
  //   setState(() {
  //     quantities[index]++;
  //   });
  // }

  // void decrementQuantity(int index) {
  //   setState(() {
  //     quantities[index]--;
  //   });
  // }

  Stream<List<Map<String, dynamic>>> getCartItems() {
    try {
      Stream<QuerySnapshot> querySnapshotStream = FirebaseFirestore.instance
          .collection("users")
          .doc(shareprefvalue)
          .collection("cartitems")
          .snapshots();
      return querySnapshotStream.map((QuerySnapshot) {
        List<Map<String, dynamic>> allDocs = [];
        QuerySnapshot.docs.forEach((docs) {
          Map<String, dynamic> docmentData =
              docs.data() as Map<String, dynamic>;
          allDocs.add(docmentData);
        });
        return allDocs;
      });
    } catch (e) {
      print("Some error Occurs $e");
      return Stream.empty();
    }
  }

  List<String> cartitems = [];
  Future<List<String>> getCartitemid() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(shareprefvalue)
          .collection('cartitems')
          .get();
      querySnapshot.docs.forEach((docid) {
        cartitems.add(docid.id);
        print("EEEEEEEEEEEEEE $cartitems");
      });
    } catch (e) {
      print("Error on getting cart items $e");
    }
    return cartitems;
  }

  Future<void> deleteCartitems(String cartitemid) async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(shareprefvalue)
          .collection('cartitems')
          .doc(cartitemid);
      await documentReference.delete();
    } catch (e) {
      print("Something went wrong $e");
    }
  }

  void cartitemDeleteButton(String cartitemid) {
    deleteCartitems(cartitemid.toString());
  }

  // double getCartToaL() {
  //   double total = 0.00;
  //   setState(() {
  //     for (var i = 0; i < widget. productName.length; i++) {
  //       total += quantities[i] * [i];
  //     }
  //   });
  //   return total;
  // }
  @override
  void initState() {
    super.initState();
    getCartitemid();
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
          'My Carts',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: getCartItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.redAccent),
              );
            } else if (snapshot.hasData) {
              List<Map<String, dynamic>> items = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height / 2,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                cartitemDeleteButton("${cartitems[index]}");
                              },
                              background: Container(
                                height: 100,
                                width: size.width,
                                padding: const EdgeInsets.only(right: 15.0),
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "delete",
                                  style: GoogleFonts.mPlus1(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => const Selecteditempage(),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      height: 100,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 237, 237, 237),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 202, 201, 201),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Image.network(
                                                  items[index]["image"],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(14.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  items[index]["name"],
                                                  style: GoogleFonts.mPlus1(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                        Icons
                                                            .attach_money_outlined,
                                                        size: 18),
                                                    Text(
                                                      items[index]["price"],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(
                                            flex: 2,
                                          ),
                                          // Row(
                                          //   children: [
                                          //     IconButton(
                                          //         onPressed: () {
                                          //           decrementQuantity(index);
                                          //         },
                                          //         icon: const Icon(Icons.remove)),
                                          //     Text(quantities[index].toString()),
                                          //     IconButton(
                                          //         onPressed: () {
                                          //           incrementQuantity(index);
                                          //         },
                                          //         icon: const Icon(Icons.add)),
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 30),
                    SingleChildScrollView(
                      child: Container(
                        height: size.height / 3,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Item cost ',
                                    style: GoogleFonts.mPlus1(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(Icons.attach_money_outlined,
                                          size: 17),
                                      Text(
                                        '450.00',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Shipping rate',
                                    style: GoogleFonts.mPlus1(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(Icons.attach_money_outlined,
                                          size: 20),
                                      Text(
                                        '20.00',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Rate',
                                    style: GoogleFonts.mPlus1(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.attach_money_outlined,
                                          size: 20),
                                      Text(
                                        "",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      shape: const CircleBorder(),
                                      value: ischecked,
                                      onChanged: (value) {
                                        setState(() {
                                          ischecked = value;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Select Allitems',
                                      style: GoogleFonts.mPlus1(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 35,
                                ),
                                Container(
                                  height: 45,
                                  width: size.width / 2,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.redAccent),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent),
                                    onPressed: () {},
                                    child: Text(
                                      'CheckOut',
                                      style: GoogleFonts.mPlus1(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Text("No Items");
          }),
    );
  }
}
