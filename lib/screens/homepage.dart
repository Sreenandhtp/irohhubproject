import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:irohubproject/screens/cart.dart';
import 'package:irohubproject/screens/home.dart';
import 'package:irohubproject/screens/mycart.dart';

import 'package:irohubproject/screens/profile.dart';
import 'package:irohubproject/screens/wishespage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> tabwidgets = [
    const Home(),
    const Wishespage(),
    const Mycart(),
    const Profilepage()
  ];
  int indexnum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: indexnum,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                color: Colors.redAccent,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Colors.redAccent,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.redAccent,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
              label: ''),
        ],
        onTap: (int index) {
          setState(() {
            indexnum = index;
          });
        },
      ),
      body: Center(child: tabwidgets.elementAt(indexnum)),
    );
  }
}
