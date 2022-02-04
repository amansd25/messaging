import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;

main() {
  print(randomBetween(10, 20)); // some integer between 10 and 20
  print(randomNumeric(4)); // sequence of 4 random numbers i.e. 3259
  print(randomString(10)); // random sequence of 10 characters i.e. e~f93(4l-
  print(randomAlpha(5)); // random sequence of 5 alpha characters i.e. aRztC
  print(randomAlphaNumeric(
      10)); // random sequence of 10 alpha numeric i.e. aRztC1y32B

  var r = Random.secure();
  print(randomBetween(10, 20,
      provider:
      CoreRandomProvider.from(r))); // You can use a provider from Random.
  print(randomBetween(10, 20,
      provider: _Provider())); // Or you can implement your own.
}

class _Provider with AbstractRandomProvider {
  _Provider();
  double nextDouble() => 0.5;
}
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    int number = 918404809235;
    return Material(
      color: Colors.white,
      child: Column(
        children: [

          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
            child: Column(
              children: [
                SizedBox(
                height: 40.0,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter Message",
                    labelText: "Message",
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () async => await launch(
                        "https://wa.me/${number}?text=Hello"),
                    child: Text('Open Whatsapp'),

                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
