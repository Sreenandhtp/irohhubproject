import 'package:flutter/material.dart';

import 'package:irohubproject/widgets/passwordfield.dart';
import 'package:irohubproject/widgets/textfield.dart';

class Passwordchange extends StatefulWidget {
  const Passwordchange({super.key});

  @override
  State<Passwordchange> createState() => _PasswordchangeState();
}

class _PasswordchangeState extends State<Passwordchange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            )),
        title: const Text(
          'Change Password',
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              TextfieldName(fieldtext: 'Reset Password'),
              const SizedBox(
                height: 5,
              ),
              const Passwordfield(),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  child: const Text(
                    'SEND A LINK TO E-MAIL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
