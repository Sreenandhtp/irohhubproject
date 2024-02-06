import 'dart:async';
import 'package:flutter/material.dart';
import 'package:irohubproject/homepage.dart';
import 'package:irohubproject/loginpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalemail;

class Flashscreen extends StatefulWidget {
  const Flashscreen({super.key});

  @override
  State<Flashscreen> createState() => _FlashscreenState();
}

class _FlashscreenState extends State<Flashscreen> {
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    finalemail == null ? const loginpage() : const Homepage(),
              )));
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalemail = obtainedEmail.toString();
    });
    print(finalemail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 38, 38),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                'asset/logo1.jpg',
                fit: BoxFit.cover,
              )),
          // Text(
          //   'From',
          //   style: TextStyle(fontSize: 10),
          // ),
          // SizedBox(height: 5),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     FaIcon(
          //       FontAwesomeIcons.meta,
          //       size: 22,
          //     ),
          //     SizedBox(width: 6),
          //     Text(
          //       'Meta',
          //       style: TextStyle(fontSize: 15, color: Colors.black),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
