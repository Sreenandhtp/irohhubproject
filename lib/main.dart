import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:irohubproject/flashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const Flashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
