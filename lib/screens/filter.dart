import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sort by',
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
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
                        Text(
                          'Featured',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
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
                        Text(
                          'New Items',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
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
                        Text(
                          'Price(high)',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
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
                        Text(
                          'Price(low)',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
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
                    hint: Text(
                      '   Price',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: price.map((String price) {
                      return DropdownMenuItem(
                          value: price,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                price,
                                style: GoogleFonts.mPlus1(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )));
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
                    hint: Text(
                      '   Brands',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: brands.map((String brands) {
                      return DropdownMenuItem(
                          value: brands,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                brands,
                                style: GoogleFonts.mPlus1(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )));
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
                    hint: Text(
                      '   Colors',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: colors.map((String colors) {
                      return DropdownMenuItem(
                          value: colors,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                colors,
                                style: GoogleFonts.mPlus1(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )));
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
                    hint: Text(
                      '   Size',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
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
                              style: GoogleFonts.mPlus1(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
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
                    hint: Text(
                      '   Catogories',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    elevation: 0,
                    borderRadius: BorderRadius.circular(10),
                    items: catogories.map((String catogories) {
                      return DropdownMenuItem(
                          value: catogories,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                catogories,
                                style: GoogleFonts.mPlus1(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )));
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
                child: Text(
                  'APPLY',
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
