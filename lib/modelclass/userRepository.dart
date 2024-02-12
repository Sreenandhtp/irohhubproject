import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:irohubproject/screens/mycart.dart';
import 'package:irohubproject/screens/wishespage.dart';
import 'package:irohubproject/variables/sharedpref.dart';

class UserRepository {
  Future<void> saveCartItems(
      String name, String image, String price, BuildContext context) async {
    Map<String, dynamic> toMyPage() {
      return {"name": name, "image": image, "price": price};
    }

    String cartitems = "cartitems";

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(shareprefvalue);
    CollectionReference collectionReference =
        documentReference.collection(cartitems);
    try {
      await collectionReference.add(toMyPage());
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const Mycart(),
      //     ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Item Added in cart.....",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    } catch (error) {
      print("Some error occurs $error");
    }
  }
}

class UserRepository1 {
  Future<void> savewishesItems(
      String name, String image, String price, BuildContext context) async {
    Map<String, dynamic> toMyPage() {
      return {"name": name, "image": image, "price": price};
    }

    String wishesitems = "wishesitems";

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("users").doc(shareprefvalue);
    CollectionReference collectionReference =
        documentReference.collection(wishesitems);
    try {
      await collectionReference.add(toMyPage());
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => const Wishespage(),
      //     ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Item Added in wish list....",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    } catch (error) {
      print("Some error occurs $error");
    }
  }
}
