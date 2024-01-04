import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/myprofile.dart';

class Profilefields extends StatelessWidget {
  String profilefieldtext;
  IconData iconData;
  final void Function() buttonAction;

  Profilefields(
      {super.key,
      required this.profilefieldtext,
      required this.iconData,
      required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 236, 236),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(iconData),
                  const SizedBox(width: 25),
                  Text(
                    profilefieldtext,
                    style: GoogleFonts.mPlus1(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: buttonAction,
                icon: const Icon(
                  Icons.arrow_forward_outlined,
                ))
          ],
        ),
      ),
    );
  }
}
