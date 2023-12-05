import 'package:flutter/material.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class Shoespage extends StatefulWidget {
  const Shoespage({super.key});

  @override
  State<Shoespage> createState() => _ShoespageState();
}

class _ShoespageState extends State<Shoespage> {
  @override
  Widget build(BuildContext context) {
    List<String> shoeimages = [
      'asset/shoeimage2.jpg',
      'asset/adidas.jpg',
      'asset/puma.jpg',
      'asset/coverse.jpg',
      'asset/nb.jpg',
      'asset/beneten.jpg',
      'asset/bata.jpg',
      'asset/sparx.jpg',
      'asset/redtape.jpg',
      'asset/woodland.jpg'
    ];
    List<String> Shoenames = [
      'Nike',
      'Adidas',
      'puma',
      'Convers',
      'NB',
      'Beneten',
      'Bata',
      'Sparx',
      'Red Tape',
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
                              shoeimages[index],
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
                              Shoenames[index],
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
