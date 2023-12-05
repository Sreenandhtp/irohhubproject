import 'package:flutter/material.dart';

class Myprofilefield extends StatelessWidget {
  IconData iconData;

  Myprofilefield({
    super.key,
    required this.iconData,
  });
// required this.ActionButton
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: TextField(
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 255, 254, 254),
              prefixIcon: Icon(iconData),
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 5, color: Colors.black),
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
