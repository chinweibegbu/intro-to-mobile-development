import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String insultText;
  String authorName;

  SecondScreen({Key? key, required this.insultText, required this.authorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  insultText,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text("- John Doe")),
              )
            ],
          )),
    );
  }
}
