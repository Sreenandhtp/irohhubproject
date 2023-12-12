import 'package:flutter/material.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class Skincarepage extends StatefulWidget {
  const Skincarepage({super.key});

  @override
  State<Skincarepage> createState() => _SkincarepageState();
}

class _SkincarepageState extends State<Skincarepage> {
  @override
  Widget build(BuildContext context) {
    List<String> Skinitems = [
      'asset/Shampo.jpg',
      'asset/dove.jpg',
      'asset/soap.jpg',
      'asset/bodycare1.jpg',
      'asset/facecare3.jpg',
      'asset/facewash.jpg',
      'asset/facewash1.jpg',
      'asset/mamaearth.jpg',
      'asset/haircare.jpg',
      'asset/bodycare1.jpg'
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: 10,
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
                        child: Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 232, 232),
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              Skinitems[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'MamaEarth',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                      const Row(
                        children: [
                          Icon(Icons.attach_money_outlined, size: 18),
                          Text(
                            '10.00',
                            style: TextStyle(
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
