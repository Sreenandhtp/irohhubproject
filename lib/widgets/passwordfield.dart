import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Passwordfield extends StatelessWidget {
  const Passwordfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: TextField(
        inputFormatters: [LengthLimitingTextInputFormatter(10)],
        obscureText: true,
        obscuringCharacter: '•',
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 243, 241, 241),
            prefixIcon: const Icon(Icons.fingerprint),
            // suffix: IconButton(
            //     onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 5, color: Colors.black),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
