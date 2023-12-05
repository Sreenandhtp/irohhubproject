import 'package:flutter/material.dart';
import 'package:irohubproject/loginpage.dart';
import 'package:irohubproject/widgets/passwordfield.dart';
import 'package:irohubproject/widgets/textfield.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const loginpage(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            )),
        title: const Text(
          'Sign In',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(height: 10),
            TextfieldName(fieldtext: 'Name'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 243, 241, 241),
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 5, color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            const SizedBox(height: 10),
            TextfieldName(fieldtext: 'E-mail'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 243, 241, 241),
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 5, color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            const SizedBox(height: 10),
            TextfieldName(fieldtext: 'Password'),
            const SizedBox(
              height: 5,
            ),
            const Passwordfield(),
            const SizedBox(height: 10),
            TextfieldName(fieldtext: 'Re-Password'),
            const SizedBox(
              height: 5,
            ),
            const Passwordfield(),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Are you agree to the.."),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signinpage(),
                            ));
                      },
                      child: const Text(
                        'Terms & conditions ',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
