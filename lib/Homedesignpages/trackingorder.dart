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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Text(
                  'Track your order',
                  style: GoogleFonts.mPlus1(
                      textStyle:
                          const TextStyle(fontSize: 28, color: Colors.black)),
                ),
                trailing: const Icon(Icons.more_vert),
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: size.width,
                      height: size.height / 2,
                      color: Colors.white,
                    ),
                  );
                }),
              )
            ],
          ),
        ));
  }
}
