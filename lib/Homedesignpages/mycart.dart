import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mycart extends StatefulWidget {
  const Mycart({super.key});

  @override
  State<Mycart> createState() => _MycartState();
}

class _MycartState extends State<Mycart> {
  var size, height, width;
  bool? ischecked = false;
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
        child: Column(
          children: [
            Container(
              height: size.height / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.redAccent,
                              shape: const CircleBorder(),
                              value: ischecked,
                              onChanged: (value) {
                                setState(() {
                                  ischecked = value;
                                });
                              },
                            ),
                            Container(
                              height: 120,
                              width: 340,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 237, 237, 237),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 202, 201, 201),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Selected items',
                                          style: GoogleFonts.mPlus1(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 60),
                                          child: Row(
                                            children: [
                                              Icon(Icons.attach_money_outlined,
                                                  size: 18),
                                              Text(
                                                '50.00',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 219, 219, 219),
                                      ),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                            color:
                                                Color.fromARGB(255, 82, 81, 81),
                                          )))
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              child: Container(
                height: size.height / 3,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items ',
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19)),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.attach_money_outlined, size: 20),
                              Text(
                                '450.00',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping rate',
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19)),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.attach_money_outlined, size: 20),
                              Text(
                                '20.00',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Rate',
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19)),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.attach_money_outlined, size: 20),
                              Text(
                                '470.00',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              shape: const CircleBorder(),
                              value: ischecked,
                              onChanged: (value) {
                                setState(() {
                                  ischecked = value;
                                });
                              },
                            ),
                            Text(
                              'Select Allitems',
                              style: GoogleFonts.mPlus1(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 45,
                          width: size.width / 2,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.redAccent),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent),
                            onPressed: () {},
                            child: Text(
                              'CheckOut',
                              style: GoogleFonts.mPlus1(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
