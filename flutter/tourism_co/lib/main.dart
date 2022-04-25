import 'package:flutter/material.dart';

// Runs the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 200,
          width: 200,
          color: Colors.green,
        ),
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
        )
      ]),
    );
  }
}
