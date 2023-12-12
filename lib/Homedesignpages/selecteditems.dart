import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/addresspage.dart';
import 'package:irohubproject/Homedesignpages/mycart.dart';

class Selecteditempage extends StatefulWidget {
  const Selecteditempage({super.key});

  @override
  State<Selecteditempage> createState() => _SelecteditempageState();
}

class _SelecteditempageState extends State<Selecteditempage> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(
            margin: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
                shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.black,
                )),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 238, 238),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.black,
                  )),
            ),
            Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 20,
                      color: Colors.black,
                    ))),
          ],
          elevation: 0,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.asset(
                  'asset/selectedbag.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned(
              //     child: Column(
              //   children: [
              //     Container(
              //       decoration: const BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.white,
              //       ),
              //     ),
              //     Container(
              //       decoration: const BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: Colors.red,
              //       ),
              //     )
              //   ],
              // )),

              Container(
                height: size.height / 2,
                width: size.width,
                decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 14)],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nike Air Max',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.attach_money_outlined, size: 22),
                                Text(
                                  '250.00',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('asset/star.png')),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('asset/star.png')),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('asset/star.png')),
                        SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.asset('asset/star.png')),
                        const SizedBox(
                            height: 25,
                            width: 25,
                            child: Icon(Icons.star_border_outlined)),
                        const Text('(108)')
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Let him understand these little things. My eternal salvation is anticipatory, for he does not receive it. And these little elites must understand the antiope to receive',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 45,
                          width: size.width / 2,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Mycart(),
                                  ));
                            },
                            child: Text(
                              'ADD TO CART',
                              style: GoogleFonts.mPlus1(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 45,
                          width: size.width / 2.8,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.redAccent),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Addresspage(),
                                  ));
                            },
                            child: Text(
                              'Buy Now',
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
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
