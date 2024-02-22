import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irohubproject/authentication/authcontroller.dart';
import 'package:irohubproject/authentication/googleauth/googlelogin.dart';
import 'package:irohubproject/screens/forgottpassword.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irohubproject/screens/homepage.dart';
import 'package:irohubproject/login_and_signin/signinpage.dart';
import 'package:irohubproject/variables/sharedpref.dart';
import 'package:irohubproject/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final FirebaseAuthService auth = FirebaseAuthService();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool passwordObsecured = true;
  bool isLoading = false;

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
              height: 60,
              child: TextFormField(
                controller: passwordcontroller,
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                obscureText: passwordObsecured,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 243, 241, 241),
                    prefixIcon: const Icon(Icons.lock),
                    suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordObsecured = !passwordObsecured;
                          });
                        },
                        icon: Icon(passwordObsecured
                            ? Icons.visibility_off
                            : Icons.visibility)),
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
                onPressed: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString('email', emailcontroller.text);
                  login();

                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(const Duration(seconds: 3));
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
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
                      onPressed: () {
                        
                        FirebaseServiece.signInwithGoogle(context);
                      }),
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

  void login() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;

    final userCredential =
        await auth.signInWithEmailAndPassword(email, password);
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(
      'id',
      userCredential!.uid,
    );
    shareprefvalue = userCredential.uid;
    print("############$shareprefvalue");

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "User Logged in Successfully...",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
    ));
  }
}
