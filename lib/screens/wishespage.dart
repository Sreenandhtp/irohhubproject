import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/modelclass/userRepository.dart';
import 'package:irohubproject/variables/sharedpref.dart';

import 'selecteditems.dart';

class Wishespage extends StatefulWidget {
  const Wishespage({super.key});

  @override
  State<Wishespage> createState() => _WishespageState();
}

class _WishespageState extends State<Wishespage> {
  final controller = UserRepository1();
  var size, height, width;
  // List<String> items = [
  //   'Selected items',
  //   'Selected items',
  //   'Selected items',
  //   'Selected items',
  //   'Selected items'
  // ];
  Stream<List<Map<String, dynamic>>> getwishesItems() {
    try {
      Stream<QuerySnapshot> querySnapshotStream = FirebaseFirestore.instance
          .collection("users")
          .doc(shareprefvalue)
          .collection("wishesitems")
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

  List<String> wishesitems = [];
  Future<List<String>> getWishesitemid() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(shareprefvalue)
          .collection('wishesitems')
          .get();
      querySnapshot.docs.forEach((docid) {
        wishesitems.add(docid.id);
      });
    } catch (e) {
      print("Error on getting wishes items $e");
    }
    return wishesitems;
  }

  Future<void> deleteWishesitems(String wishesitemid) async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('users')
          .doc(shareprefvalue)
          .collection('wishesitems')
          .doc(wishesitemid);
      await documentReference.delete();
    } catch (e) {
      print("Something went wrong $e");
    }
  }

  void wishesitemDeleteButton(String wishesitemid) {
    deleteWishesitems(wishesitemid.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWishesitemid();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
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
          'Wishes',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 249, 247, 247),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert,
                    color: Color.fromARGB(255, 45, 45, 45)),
              )),
        ],
      ),
      body: StreamBuilder(
          stream: getwishesItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.redAccent),
              );
            } else if (snapshot.hasData) {
              List<Map<String, dynamic>> items = snapshot.data!;
              print("QQQQQQQQQQQQ$items");
              if (items.isNotEmpty) {
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            wishesitemDeleteButton(wishesitems[index]);
                          });
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
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: InkWell(
                            onTap: () => const Selecteditempage(),
                            child: Container(
                              height: 90,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 237, 237, 237),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 202, 201, 201),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              items[index]['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                items[index]['name'],
                                                style: GoogleFonts.mPlus1(
                                                    textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                              ),
                                              const SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .attach_money_outlined,
                                                      size: 18),
                                                  Text(
                                                    items[index]['price'].toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: IconButton(
                                        onPressed: () {
                                          wishesitemDeleteButton(
                                              "${wishesitems[index]}");
                                        },
                                        icon: const Icon(
                                          Icons.cancel_rounded,
                                          color: Color.fromARGB(
                                              255, 159, 158, 158),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Image.network(
                        "https://www.taazashahimewa.com/assets/front/images/wishlist-empty1.jpg"),
                  ),
                );
              }
            }
            return Container();
          }),
    );
  }
}
