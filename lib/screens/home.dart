import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/map/currentlocation.dart';
import 'package:irohubproject/screens/filter.dart';
import 'package:irohubproject/screens/mycart.dart';
import 'package:irohubproject/screens/profile.dart';
import 'package:irohubproject/tabbar_pages/allitems.dart';
import 'package:irohubproject/tabbar_pages/bagspage.dart';
import 'package:irohubproject/tabbar_pages/electronicspage.dart';
import 'package:irohubproject/tabbar_pages/shoespage.dart';
import 'package:irohubproject/tabbar_pages/skincare.dart';

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
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png')),
              ),
            ),
            title: Text(
              'Shoppeee',
              style: GoogleFonts.kanit(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 182, 32, 32)),
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
                    Icons.location_on,
                    color: Colors.black,
                    size: 25,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Mycart(),
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
        body: DefaultTabController(
          animationDuration: Durations.medium3,
          length: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  unselectedLabelStyle: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(fontSize: 16)),
                  indicatorColor: Colors.redAccent,
                  labelStyle: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  labelColor: Colors.black,
                  tabs: const [
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
              const Expanded(
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
