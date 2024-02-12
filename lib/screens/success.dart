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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "The item Purchased Successfullyy.....",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        isLoading
            ? Padding(
                padding: const EdgeInsets.only(left: 130),
                child: Row(
                  children: [
                    Text("Proccessing....."),
                    Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
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
      ]),
    );
  }
}
