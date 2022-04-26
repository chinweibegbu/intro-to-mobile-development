import 'package:flutter/material.dart';
import 'package:quotesapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Use an HTTP GET request
              var url = Uri.parse(
                  'https://evilinsult.com/generate_insult.php?lang=en&type=json');
              var response = await http.get(url);
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              // Parse the JSON data
              var data = jsonDecode(response.body);
              String insult = (data['insult']);
              String author = (data['createdby']);

              // Navigate to the SecondScreen dart file
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen(
                        insultText: insult,
                        authorName: author,
                      )));
            },
            child: Text("Get Insult"),
          ),
        ),
      ),
    );
  }
}
