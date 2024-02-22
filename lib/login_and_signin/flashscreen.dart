import 'dart:async';
import 'package:flutter/material.dart';
import 'package:irohubproject/screens/homepage.dart';
import 'package:irohubproject/login_and_signin/loginpage.dart';
import 'package:irohubproject/variables/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

var finalemail;

class Flashscreen extends StatefulWidget {
  const Flashscreen({super.key});

  @override
  State<Flashscreen> createState() => _FlashscreenState();
}

class _FlashscreenState extends State<Flashscreen> {
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalemail = obtainedEmail;
    });
    print("MMMMMMMMMMMMMMMMMMM$finalemail");
  }

  Future getsharedprefData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedid = sharedPreferences.getString('id');
    setState(() {
      shareprefvalue = obtainedid.toString();
    });
    print("ZZZZZZZZZZZZZZ$shareprefvalue");
  }

  void initState() {
    getsharedprefData();
    super.initState();
    print("************$getsharedprefData");
    print("bbbbbbbbbbbbbbbb$finalemail");
    getValidationData().whenComplete(() {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    finalemail == null ? const loginpage() : const Homepage(),
              )));
      print("VVVVVVVVVVVVVVVVVVVV$shareprefvalue");
      print("RRRRRRRRRRRRRRRRR$finalemail");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "asset/Screenshot 2024-02-21 012524.png",
          fit: BoxFit.cover,
        ),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.only(left: 40),
      //       child: Text(
      //         """Welcome to
      // IrohShop....""",
      //         style: GoogleFonts.mPlus1(
      //             textStyle: const TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 45,
      //                 color: Color.fromARGB(255, 185, 48, 38))),
      //       ),
      //     )
      //     // Text(
      //     //   'From',
      //     //   style: TextStyle(fontSize: 10),
      //     // ),
      //     // SizedBox(height: 5),
      //     // Row(
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   children: [
      //     //     FaIcon(
      //     //       FontAwesomeIcons.meta,
      //     //       size: 22,
      //     //     ),
      //     //     SizedBox(width: 6),
      //     //     Text(
      //     //       'Meta',
      //     //       style: TextStyle(fontSize: 15, color: Colors.black),
      //     //     )
      //     //   ],
      //     // )
      //   ],
      // ),
    );
  }
}
