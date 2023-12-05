import 'package:flutter/material.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class bagspage extends StatefulWidget {
  const bagspage({super.key});

  @override
  State<bagspage> createState() => _bagspageState();
}

class _bagspageState extends State<bagspage> {
  @override
  Widget build(BuildContext context) {
    List<String> bagimages = [
      'asset/selectedbag.jpg',
      'asset/bagimage1.jpg',
      'asset/bag1.jpg',
      'asset/bagimage3.jpg',
      'asset/bagimage4.jpg',
      'asset/bagimage5.jpg',
      'asset/bagimage6.jpg',
      'asset/bagimage7.jpg',
      'asset/bagimage8.jpg',
      'asset/bagimage9.jpg'
    ];
    List<String> bagname = [
      'Gucci',
      'Louis Vuitton',
      'Dior',
      'Chanel',
      'Marc Jacobs',
      'Hermès',
      'Dior',
      'Lavie',
      'Prada',
      'Gucci'
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
                          width: 160,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 233, 232, 232),
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              bagimages[index],
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
                            Text(
                              bagname[index],
                              style: const TextStyle(
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
                            '50.00',
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
