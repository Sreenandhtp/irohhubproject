import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _MycartState();
}

class _MycartState extends State<CartPage> {
  var size, height, width;

  List<String> itemsName = [
    'Item1',
    'Item1',
    'Item1',
    'Item1',
    'Item1',
    'Item1',
    'Item1',
    'Item1'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
          'My Carts',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        actions: [
          Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.only(right: 15),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 238, 237, 237),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_outline,
                    color: Color.fromARGB(255, 40, 39, 39)),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.builder(
              itemCount: itemsName.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      itemsName.removeAt(index);
                    });
                  },
                  background: Container(
                    height: 100,
                    width: size.width,
                    padding: const EdgeInsets.only(right: 15.0),
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.delete_rounded,
                      color: Colors.white,
                    ),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Selecteditempage(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Container(
                            height: 100,
                            width: 400,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 237, 237, 237),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 202, 201, 201),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    // child: Image.network(
                                    //   '',
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        itemsName[index],
                                        style: GoogleFonts.mPlus1(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(Icons.attach_money_outlined,
                                              size: 18),
                                          Text(
                                            '50.00',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
