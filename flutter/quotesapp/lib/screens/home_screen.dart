import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String insult = "";
  String date = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              insult,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Align(alignment: Alignment.bottomRight, child: Text(date)),
          ),
          ElevatedButton(
            onPressed: () async {
              // Use an HTTP GET request
              var url = Uri.parse(
                  'https://evilinsult.com/generate_insult.php?lang=en&type=json');
              var response = await http.get(url);
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              // Parse the JSON data
              var data = jsonDecode(response.body);
              insult = (data['insult']);
              date = (data['created']);

              // Reset state
              setState(() {});
            },
            child: Text("Get Insult"),
          ),
        ]),
      ),
    );
  }
}
