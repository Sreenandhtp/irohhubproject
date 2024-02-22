import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/screens/addresspage.dart';
import 'package:irohubproject/modelclass/userRepository.dart';

class Selecteditempage extends StatefulWidget {
  final selelctedAllitems;
  const Selecteditempage({super.key, this.selelctedAllitems});

  @override
  State<Selecteditempage> createState() => _SelecteditempageState();
}

class _SelecteditempageState extends State<Selecteditempage> {
  final cartcontroller = UserRepository();
  final wishescontroller = UserRepository1();
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.black,
                )),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.black,
                  )),
            ),
            Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 20,
                      color: Colors.black,
                    ))),
          ],
          elevation: 0,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Stack(children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      widget.selelctedAllitems['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 20,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTap = !isTap;
                              wishescontroller.savewishesItems(
                                  widget.selelctedAllitems["name"],
                                  widget.selelctedAllitems["image"],
                                  widget.selelctedAllitems["price"],
                                  context);
                            });
                          },
                          child: isTap
                              ? const Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_sharp,
                                  size: 30,
                                )))
                ]),
              ),
              Container(
                height: size.height / 2,
                width: size.width,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 14)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selelctedAllitems["name"],
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.attach_money_outlined,
                                    size: 22),
                                Text(
                                  widget.selelctedAllitems["price"].toString(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.topLeft,
                      child: RatingBar.builder(
                        itemSize: 25,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        // itemPadding:
                        //     const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 250, 189, 5),
                          ),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text("Qty :",
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                        Text("1",
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)))
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Details',
                        style: GoogleFonts.mPlus1(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Let him understand these little things. My eternal salvation is anticipatory, for he does not receive it. And these little elites must understand the antiope to receive',
                        style: GoogleFonts.mPlus1(
                            textStyle: const TextStyle(fontSize: 15)),
                      ),
                    ),
                    const SizedBox(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 45,
                          width: size.width / 2,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent),
                            onPressed: () {
                              cartcontroller.saveCartItems(
                                  widget.selelctedAllitems["name"],
                                  widget.selelctedAllitems["image"],
                                  widget.selelctedAllitems["price"],
                                  context);
                            },
                            child: Text(
                              'ADD TO CART',
                              style: GoogleFonts.mPlus1(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: size.width / 2.8,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.redAccent),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Addresspage(),
                                  ));
                            },
                            child: Text(
                              'Buy Now',
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
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
