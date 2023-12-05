import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class Allitems extends StatefulWidget {
  const Allitems({super.key});

  @override
  State<Allitems> createState() => _AllitemsState();
}

class _AllitemsState extends State<Allitems> {
  List<String> items1 = [
    'asset/bag.jpg',
    'asset/shoeimage2.jpg',
    'asset/haircare.jpg',
    'asset/kidsshoes.jpg',
    'asset/mamaearth.jpg'
  ];
  List<String> itemname = [
    'Gucci bag',
    'Nike shoes',
    'Haircare',
    'kids Shoes',
    'MamaEarth'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              Stack(children: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                        image: AssetImage('asset/skincare.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const Positioned(
                  top: 30,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        'SKINCARE',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 90, 79, 79)),
                      ),
                      Text('PRODUCTS WITH BIG OFFER',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 90, 79, 79)))
                    ],
                  ),
                )
              ]),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                          image: AssetImage('asset/images.jpg'),
                          fit: BoxFit.cover)),
                ),
                const Positioned(
                    top: 50,
                    left: 25,
                    child: Column(
                      children: [
                        Text(
                          '50% OFF',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'SPORTS SHOES',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ))
              ]),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                        image: AssetImage('asset/ladiesbags.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const Positioned(
                  top: 30,
                  left: 10,
                  child: Column(
                    children: [
                      Text(
                        '25% OFFER',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'FOR ALL BAGS',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ]),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                          image: AssetImage('asset/shoe5.jpg'),
                          fit: BoxFit.cover)),
                ),
                const Positioned(
                    top: 30,
                    left: 30,
                    child: Column(
                      children: [
                        Text(
                          'KIDS ITEMS',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 68, 67, 67)),
                        ),
                        Text(
                          '50% OFF',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 68, 67, 67)),
                        ),
                      ],
                    ))
              ]),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                        image: AssetImage('asset/best_hairdryers.avif'),
                        fit: BoxFit.cover),
                  ),
                ),
              ]),
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 900),
              viewportFraction: 0.8,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Popular',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.redAccent, fontSize: 15),
                    )),
              )
            ],
          ),
          LimitedBox(
            maxHeight: 260,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Selecteditempage(),
                            ));
                      },
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Selecteditempage(),
                              ));
                        },
                        child: Container(
                          height: 280,
                          width: 200,
                          decoration: BoxDecoration(
                              // boxShadow: const [
                              //   BoxShadow(blurRadius: 5, offset: Offset(1, 0))
                              // ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10)),
                        ),
                      ),
                    ),
                    Positioned(
                        child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Selecteditempage(),
                              ));
                        },
                        child: Container(
                            height: 160,
                            width: 180,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 250, 249, 249),
                                borderRadius:
                                    BorderRadiusDirectional.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                items1[index],
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    )),
                    Positioned(
                        top: 180,
                        left: 14,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              itemname[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 50),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.card_travel_sharp,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ),
                            )
                          ],
                        )),
                    const Positioned(
                        top: 210,
                        left: 10,
                        child: Row(
                          children: [
                            Icon(Icons.attach_money_outlined, size: 20),
                            Text(
                              '50.00',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ))
                  ]),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'New Arrival',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.redAccent, fontSize: 15),
                    )),
              )
            ],
          ),
          LimitedBox(
            maxHeight: 140,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Selecteditempage(),
                              ));
                        },
                        child: Container(
                          width: 280,
                          height: 140,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 245, 245, 245),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Positioned(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Selecteditempage(),
                                ));
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 235, 234, 234),
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'asset/bag1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )),
                      Positioned(
                          left: 130,
                          top: 10,
                          child: Column(
                            children: [
                              const Text(
                                'Chanel Bag',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '''Lorem ipsum is best always
sum is best always''',
                                style: TextStyle(fontSize: 10),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.attach_money_outlined,
                                          size: 15),
                                      Text(
                                        '50.00',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 60),
                                  Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.card_travel,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ))
                    ]),
                  );
                }),
          )
        ],
      ),
    );
  }
}
