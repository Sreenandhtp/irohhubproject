import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohubproject/Homedesignpages/payment.dart';

class Addresspage extends StatefulWidget {
  const Addresspage({super.key});

  @override
  State<Addresspage> createState() => _AddresspageState();
}

class _AddresspageState extends State<Addresspage> {
  String dropcountrynamevalue = 'USA(United State America)';
  var country = [
    'USA(United State America)',
    'UK',
    'Dubai',
    'India',
    'China',
    'Japan',
    'SriLenkha',
    'Australia'
  ];
  String dropphonevalue = '+91';
  var phone = ['+91', '+90', '+14', '70'];
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
        title: Text(
          'Add Your Address',
          style: GoogleFonts.mPlus1(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black)),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Country',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 243, 243),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonFormField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        hint: Text(
                          '  Select Country',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(10),
                        items: country.map((String country) {
                          return DropdownMenuItem(
                              value: country,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    country,
                                    style: GoogleFonts.mPlus1(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  )));
                        }).toList(),
                        onChanged: (String? newvalue) {
                          setState(() {
                            dropcountrynamevalue = newvalue.toString();
                          });
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Fullname',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 7),
                      child: TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        style: GoogleFonts.mPlus1(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'City',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                      Text(
                        'Pincode',
                        style: GoogleFonts.mPlus1(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 220,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 243, 243),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 7),
                          child: TextField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 243, 243),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Delivery Address',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 243, 243),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 7),
                      child: TextField(
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                        style: GoogleFonts.mPlus1(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Contact No',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 245, 243, 243),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            elevation: 0,
                            borderRadius: BorderRadius.circular(10),
                            items: phone.map((String phone) {
                              return DropdownMenuItem(
                                  value: phone,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(phone,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ));
                            }).toList(),
                            onChanged: (String? newvalue) {
                              setState(() {
                                dropphonevalue = newvalue.toString();
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 45,
                        width: 230,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 245, 243, 243),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 7),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            style: GoogleFonts.mPlus1(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.redAccent),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Paymentpage(),
                              ));
                        },
                        child: Text(
                          'CONTINUE TO PAYMENT',
                          style: GoogleFonts.mPlus1(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
