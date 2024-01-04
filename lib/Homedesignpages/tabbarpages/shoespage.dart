import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class Shoespage extends StatefulWidget {
  const Shoespage({super.key});

  @override
  State<Shoespage> createState() => _ShoespageState();
}

class _ShoespageState extends State<Shoespage> {
  List<String> shoesimage = [];
  final storage = FirebaseStorage.instance;
  @override
  void initState() {
    super.initState();
    getImageUrl();
  }

  Future<void> getImageUrl() async {
    var storage = FirebaseStorage.instance;
    var strorageRef = storage.ref().child('Shoeimages');
    var list = await strorageRef.listAll();

    await Future.forEach(list.items, (Reference ref) async {
      var url = await ref.getDownloadURL();

      setState(() {
        shoesimage.add(url);
      });
    });
  }

  Widget build(BuildContext context) {
    List<String> Shoenames = [
      'Adidas',
      'Bata',
      'Beneten',
      'Convers',
      'NB',
      'puma',
      'Red Tape',
      'Nike',
      'Sparx',
      'WoodLand'
    ];
    List<String> shoeprice = [
      '150.00',
      '200.00',
      '180.00',
      '170.00',
      '160.00',
      '100.00',
      '110.00',
      '100.00',
      '200.00',
      '150.00'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: shoesimage.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 220,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Selecteditempage(),
                      ));
                },
                child: Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 248, 248),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 125,
                              width: 150,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 233, 232, 232),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  shoesimage[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 109,
                                child: Container(
                                  height: 34,
                                  width: 34,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 240, 238, 238),
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_border_sharp,
                                        size: 20,
                                        color:
                                            Color.fromARGB(255, 104, 103, 103),
                                      )),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Shoenames[index],
                              style: GoogleFonts.mPlus1(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ),
                            Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.card_travel_sharp,
                                    color: Colors.white,
                                    size: 13,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.attach_money_outlined, size: 18),
                          Text(
                            shoeprice[index],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
