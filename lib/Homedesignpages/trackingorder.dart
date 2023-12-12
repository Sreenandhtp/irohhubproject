import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Trackingorder extends StatefulWidget {
  const Trackingorder({super.key});

  @override
  State<Trackingorder> createState() => _TrackingorderState();
}

class _TrackingorderState extends State<Trackingorder> {
  var size, width, height;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: SafeArea(
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Track the order',
                    style: GoogleFonts.mPlus1(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 15),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 225, 224, 224),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert,
                            color: Color.fromARGB(255, 45, 45, 45)),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: size.height / 3,
                  width: size.width,
                  color: Colors.blue,
                );
              })
        ]),
      ),
    );
  }
}
