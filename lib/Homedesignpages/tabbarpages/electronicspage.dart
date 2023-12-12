import 'package:flutter/material.dart';
import 'package:irohubproject/Homedesignpages/selecteditems.dart';

class Electronicspage extends StatefulWidget {
  const Electronicspage({super.key});

  @override
  State<Electronicspage> createState() => _ElectronicspageState();
}

class _ElectronicspageState extends State<Electronicspage> {
  @override
  Widget build(BuildContext context) {
    List<String> electroitems = [
      'asset/drayer.jpg',
      'asset/hairstraighter.jpg',
      'asset/facecare.jpg',
      'asset/facemask.jpg',
      'asset/facevacuum.jpg',
      'asset/nosehairremover.jpg',
      'asset/drimmer.jpg',
      'asset/trimmer.jpg',
      'asset/bodyhair.jpg',
      'asset/drayer.jpg'
    ];
    List<String> electroitemname = [
      'Hair Drayer',
      'HairSmoother',
      'Face Massager',
      'FaceMask',
      'PimpleRemover',
      'Nose Trimmer',
      'Trimmer(Wired)',
      'Trimmer',
      'Shaving Set',
      'Hair Drayer'
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
                              electroitems[index],
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
                              electroitemname[index],
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
                            '60.00',
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
