import 'package:flutter/material.dart';

class Successpage extends StatefulWidget {
  const Successpage({super.key});

  @override
  State<Successpage> createState() => _SuccesspageState();
}

class _SuccesspageState extends State<Successpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Image.asset('asset/tik.png'),
        ),
        const Text(
          'Payment Successful',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 80,
        ),
        // Row(
        //   children: [
        //     SizedBox(
        //       height: 50,
        //       width: 140,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // Navigator.push(
        //           //     context,
        //           //     MaterialPageRoute(
        //           //       builder: (context) =>const Mycart(),
        //           //     ));
        //         },
        //         style:
        //             ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
        //         child: const Text(
        //           'Track Order',
        //           style: TextStyle(color: Colors.white),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(width: 30),
        //     SizedBox(
        //       height: 50,
        //       width: 180,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // Navigator.push(
        //           //     context,
        //           //     MaterialPageRoute(
        //           //       builder: (context) =>
        //           //           const Addresspage(),
        //           //     ));
        //         },
        //         style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.transparent),
        //         child: const Text(
        //           'Continue To Shopping',
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ]),
    );
  }
}
