import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:irohubproject/screens/homepage.dart';
import 'package:irohubproject/variables/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseServiece {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<void> signInwithGoogle(BuildContext context) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);

      Map<String, dynamic> toJson() {
        return {
          "username": googleSignInAccount.displayName,
          "email": googleSignInAccount.email,
          "id": googleSignInAccount.id
        };
      }

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(
        'id',
        googleSignInAccount.id,
      );
      shareprefvalue = googleSignInAccount.id;
      print("############$shareprefvalue");

      try {
        await db.collection("users").doc(googleSignInAccount.id).set(toJson());
      } catch (e) {
        print("Some error occure $e");
      }

      if (googleSignInAccount.id.isNotEmpty) {
        print(googleSignInAccount.id);
        print('User is Successfully Created');
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ));
      } else {
        print('Some error happend');
      }
    } catch (e) {
      print("Error $e");
    }

    Future<void> signOutFromGoogle() async {
      await _googleSignIn.signOut();
      await _auth.signOut();
    }
  }
}
