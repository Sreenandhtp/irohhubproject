import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Successpage extends StatefulWidget {
  const Successpage({super.key});

  @override
  State<Successpage> createState() => _SuccesspageState();
}

class _SuccesspageState extends State<Successpage> {
  bool isLoading = false;
  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 100,
                  color: Colors.redAccent,
                ),
              )
            : Column(
                children: [
                  Center(
                    child: Image.asset('asset/tik.png'),
                  ),
                  Text(
                    'Payment Successful',
                    style: GoogleFonts.mPlus1(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ],
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
