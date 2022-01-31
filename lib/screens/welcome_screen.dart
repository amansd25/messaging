import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text('Save'),
            ),
          ],
        ),
        body: Center(

        ),
      ),
    );
  }
}
