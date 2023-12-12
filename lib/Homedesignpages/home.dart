import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/filter.dart';
import 'package:irohubproject/Homedesignpages/profile.dart';
import 'package:irohubproject/Homedesignpages/tabbarpages/allitems.dart';
import 'package:irohubproject/Homedesignpages/tabbarpages/bagspage.dart';
import 'package:irohubproject/Homedesignpages/tabbarpages/electronicspage.dart';
import 'package:irohubproject/Homedesignpages/tabbarpages/shoespage.dart';
import 'package:irohubproject/Homedesignpages/tabbarpages/skincare.dart';
import 'package:irohubproject/Homedesignpages/trackingorder.dart';
import 'package:irohubproject/map/currentlocation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomepageState();
}

class _HomepageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profilepage(),
                      ));
                },
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('asset/IMG_9486.jpg'),
                ),
              ),
            ),
            title: Text(
              'Hi, Sreenandh...',
              style: GoogleFonts.kanit(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapSample(),
                        ));
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                    size: 25,
                  )),
            ],
            bottom: PreferredSize(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 280,
                        height: 45,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Search',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28))),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Filterpage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          size: 30,
                        )),
                  ],
                ),
                preferredSize: const Size.fromHeight(50)),
          ),
        ),
        body: const DefaultTabController(
          animationDuration: Durations.medium3,
          length: 5,
          child: Column(
            children: [
              TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  indicatorColor: Colors.redAccent,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Shoes',
                    ),
                    Tab(
                      text: 'Bags',
                    ),
                    Tab(
                      text: 'Electronics',
                    ),
                    Tab(
                      text: 'Skincares',
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  Allitems(),
                  Shoespage(),
                  bagspage(),
                  Electronicspage(),
                  Skincarepage()
                ]),
              )
            ],
          ),
        ));
  }
}
