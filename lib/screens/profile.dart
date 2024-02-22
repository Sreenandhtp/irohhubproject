import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:irohubproject/screens/myprofile.dart';
import 'package:irohubproject/login_and_signin/loginpage.dart';
import 'package:irohubproject/widgets/profilefield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  // var currentuser;
  // getProfile() async {
  //   var res = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(shareprefvalue)
  //       .get();
  //   currentuser = res.data();
  //   log("########### $currentuser");
  //   log("!!!!!!!!!!!!!!!! $shareprefvalue");
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getProfile();
  // }

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
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")),
              ),
            ),
            Text(
              "Username",
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
              buttonAction: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                sharedPreferences.remove('id');

                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const loginpage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
