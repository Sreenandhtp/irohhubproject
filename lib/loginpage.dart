import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irohubproject/Homedesignpages/home.dart';
import 'package:irohubproject/controller/authcontroller.dart';
import 'package:irohubproject/forgottpassword.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irohubproject/homepage.dart';
import 'package:irohubproject/signinpage.dart';
import 'package:irohubproject/verification.dart';
import 'package:irohubproject/widgets/textfield.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final FirebaseAuthService auth = FirebaseAuthService();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            )),
        title: const Text("Log In",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        elevation: 0,
      ),
      body: ListView(children: [
        Column(
          children: [
            const SizedBox(height: 30),
            TextfieldName(fieldtext: ' Login-ID'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                controller: emailcontroller,
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
            const SizedBox(height: 25),
            TextfieldName(fieldtext: 'Password'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 330,
              child: TextField(
                controller: passwordcontroller,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                obscureText: true,
                obscuringCharacter: '•',
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 243, 241, 241),
                    prefixIcon: const Icon(Icons.fingerprint),
                    // suffix: IconButton(
                    //     onPressed: () {}, icon: Icon(Icons.remove_red_eye)),
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 5, color: Colors.black),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Passwordchange(),
                          ));
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  Login();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Or,login with....'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook),
                      onPressed: () {}),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.google),
                      onPressed: () {}),
                  const SizedBox(
                    width: 25,
                  ),
                  IconButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      onPressed: () {}),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You don't have a account..?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signinpage(),
                            ));
                      },
                      child: const Text(
                        'Sign in ',
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

  void Login() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;

    User? user = await auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is Successfully Created');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Homepage(),
          ));
    } else {
      print('Some error happend');
    }
  }
}
