
import 'package:flutter/material.dart';
import 'package:messaging/screens/welcome_screen.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
            const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: (){
                   Navigator.push(context,
                       MaterialPageRoute(builder:
                   (context)=>const WelcomePage()),);
                    },
                    child: Text("Login"),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
