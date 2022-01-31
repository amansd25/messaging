import 'package:flutter/material.dart';
import 'package:messaging/screens/welcome_screen.dart';
import 'package:form_validation/form_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

//2
final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  late bool _success;

  late String _userEmail;

  void _signInWithEmailAndPassword() async {
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Login here",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: (String? value) {
                      var validator = Validator(
                        validators: [RequiredValidator(), EmailValidator()],
                      );
                      return validator.validate(
                        context: context,
                        label: 'Enter a valid email address',
                        value: value,
                      );
                    },
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                    ),
                  ),
                  TextFormField(
                    validator: (String? value) {
                      var validator = Validator(
                        validators: [
                          RequiredValidator(),
                        ],
                      );
                      return validator.validate(
                        context: context,
                        label: "Password can't be empty",
                        value: value,
                      );
                    },
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // _validate();
                      if (_form.currentState!.validate()) {
                        _signInWithEmailAndPassword();

                      }
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//
//
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const WelcomePage()),