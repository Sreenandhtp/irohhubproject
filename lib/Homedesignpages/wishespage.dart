import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'selecteditems.dart';

class Wishespage extends StatefulWidget {
  const Wishespage({super.key});

  @override
  State<Wishespage> createState() => _WishespageState();
}

class _WishespageState extends State<Wishespage> {
  var size, height, width;

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
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Selecteditempage(),
                      ));
                },
                child: Container(
                  height: 90,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 237, 237),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 202, 201, 201),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Selected items',
                                    style: GoogleFonts.mPlus1(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                  ),
                                  const SizedBox(height: 15),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 80),
                                    child: Row(
                                      children: [
                                        Icon(Icons.attach_money_outlined,
                                            size: 18),
                                        Text(
                                          '50.00',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 219, 219, 219),
                          ),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 82, 81, 81),
                              )))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
