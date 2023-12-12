import 'package:flutter/material.dart';

class Filterpage extends StatefulWidget {
  const Filterpage({super.key});

  @override
  State<Filterpage> createState() => _FilterpageState();
}

class _FilterpageState extends State<Filterpage> {
  String dropdownpricevalue = '0-500.00';
  var price = ['0-500', '500-1000', '1000-2000', '2000-5000'];
  String dropdownbrandvalue = 'Adidas';
  var brands = ['Adidas', 'Puma', 'Convers', 'Sparx', 'NB'];
  String dropdowncolorvalue = 'White';
  var colors = ['White', 'Black', 'Red', 'NavyBlue', 'Yellow'];
  String dropdownsizevalue = '6';
  var size = ['6', '7', '8', '9', '10'];
  String dropdowncatogoriesvalue = 'Shoes for Men';
  var catogories = [
    'Shoes for Men',
    'Shoes for Ladies',
    'Shoes for Kids',
    'Office Shoes'
  ];
  bool? ischecked = false;
  bool? ischecked1 = false;
  bool? ischecked2 = false;
  bool? ischecked3 = false;

  @override
  Widget build(BuildContext context) {
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
          'Filters',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Search', border: UnderlineInputBorder()),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sort by',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.maxFinite,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Featured',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: ischecked,
                          activeColor: Colors.redAccent,
                          onChanged: (value) {
                            setState(() {
                              ischecked = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.maxFinite,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Items',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: ischecked1,
                          activeColor: Colors.redAccent,
                          onChanged: (value) {
                            setState(() {
                              ischecked1 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.maxFinite,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price(high)',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: ischecked2,
                          activeColor: Colors.redAccent,
                          onChanged: (value) {
                            setState(() {
                              ischecked2 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.maxFinite,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Price(low)',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                          value: ischecked3,
                          activeColor: Colors.redAccent,
                          onChanged: (value) {
                            setState(() {
                              ischecked3 = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    hint: const Text(
                      '   Price',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: price.map((String price) {
                      return DropdownMenuItem(
                          value: price,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(price,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownpricevalue = newvalue.toString();
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    hint: const Text(
                      '   Brands',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: brands.map((String brands) {
                      return DropdownMenuItem(
                          value: brands,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(brands,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownbrandvalue = newvalue.toString();
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    hint: const Text(
                      '   Colors',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: colors.map((String colors) {
                      return DropdownMenuItem(
                          value: colors,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(colors,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdowncolorvalue = newvalue.toString();
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    hint: const Text(
                      '   Size',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: size.map((String size) {
                      return DropdownMenuItem(
                          value: size,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              size,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownsizevalue = newvalue.toString();
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 245, 243, 243),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    hint: const Text(
                      '   Catogories',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: catogories.map((String catogories) {
                      return DropdownMenuItem(
                          value: catogories,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(catogories,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ));
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        dropdownbrandvalue = newvalue.toString();
                      });
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 47,
              width: 330,
              child: ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text(
                  'APPLY',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
