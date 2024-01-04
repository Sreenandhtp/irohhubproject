import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/myprofile.dart';
import 'package:irohubproject/controller/authcontroller.dart';
import 'package:irohubproject/loginpage.dart';
import 'package:irohubproject/widgets/profilefield.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
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
          'Profile',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('asset/IMG_9486.jpg')),
              ),
            ),
            Text(
              'Your Name',
              style: GoogleFonts.mPlus1(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const SizedBox(
              height: 50,
            ),
            Profilefields(
                buttonAction: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Myprofile(),
                      ));
                },
                profilefieldtext: 'My Profile',
                iconData: Icons.person),
            Profilefields(
                buttonAction: () {},
                profilefieldtext: 'My Orders',
                iconData: Icons.shopping_cart_outlined),
            Profilefields(
                buttonAction: () {},
                profilefieldtext: 'Notifications',
                iconData: Icons.notifications),
            Profilefields(
                buttonAction: () {},
                profilefieldtext: 'Settings',
                iconData: Icons.settings),
            Profilefields(
              profilefieldtext: 'Logout',
              iconData: Icons.logout,
              buttonAction: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const loginpage(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
