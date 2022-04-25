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
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Text is a widget
        home: Scaffold(
          appBar: AppBar(title: Text("My First Application")),
          body: Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
        ));
  }
}
