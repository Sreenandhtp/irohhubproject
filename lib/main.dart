import 'package:flutter/material.dart';
import 'package:irohubproject/flashscreen.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home:const Flashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
