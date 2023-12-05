import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Varificationfield extends StatelessWidget {
  const Varificationfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        style: Theme.of(context).textTheme.headlineSmall,
        decoration: InputDecoration(
            hintText: '0',
            filled: true,
            fillColor: const Color.fromARGB(255, 243, 241, 241),
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 5, color: Colors.black),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
