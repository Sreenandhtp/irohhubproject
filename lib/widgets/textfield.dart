import 'package:flutter/material.dart';

class TextfieldName extends StatelessWidget {
  String fieldtext;
  TextfieldName({super.key, required this.fieldtext});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          fieldtext,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
