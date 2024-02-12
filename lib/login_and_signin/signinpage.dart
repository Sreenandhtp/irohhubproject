import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irohubproject/authentication/authcontroller.dart';
import 'package:irohubproject/login_and_signin/loginpage.dart';
import 'package:irohubproject/variables/sharedpref.dart';
import 'package:irohubproject/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({super.key});

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  final FirebaseAuthService auth = FirebaseAuthService();

  TextEditingController usenamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    usenamecontroller.dispose();
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
          'Sign Up',
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
                controller: usenamecontroller,
                style: const TextStyle(fontSize: 16),
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
                controller: emailcontroller,
                style: const TextStyle(fontSize: 16),
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
            const SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  signUp();
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Are you agree to the..",
                      style: TextStyle(fontSize: 13),
                    ),
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
                          style: TextStyle(color: Colors.blue, fontSize: 13),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  void signUp() async {
    String username = usenamecontroller.text;
    String email = emailcontroller.text;
    String password = passwordcontroller.text;

    final userCredential =
        await auth.signUpWithEmailAndPassword(email, password);
    Map<String, dynamic> toJson() {
      return {
        "username": username,
        "email": email,
        "password": password,
        "id": userCredential!.uid
      };
    }

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(
      'id',
      userCredential!.uid,
    );
    shareprefvalue = userCredential.uid;
    print("############$shareprefvalue");

    FirebaseFirestore db = FirebaseFirestore.instance;

    try {
      await db.collection("users").doc(userCredential.uid).set(toJson());
    } catch (e) {
      print("Some error occure $e");
    }

    if (userCredential.uid.isNotEmpty) {
      print(userCredential.uid);
      print('User is Successfully Created');
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const loginpage(),
          ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Sign up Successfully.....,",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ));
    } else {
      print('Some error happend');
    }
  }
}
