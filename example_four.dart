import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  // This is the code in which we dont create the Model and access the responce manually.

  var data;
  Future<void> getApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    ReuseRow(
                        value: 'Name', title: data[index]['name'].toString()),
                    ReuseRow(
                        value: 'Username',
                        title: data[index]['username'].toString()),
                    ReuseRow(
                        value: 'Email', title: data[index]['email'].toString()),
                    ReuseRow(
                        value: 'Address',
                        title: data[index]['address']['geo']['lat'].toString()),
                  ],
                ),
              );
            });
          }
        });
  }
}

class ReuseRow extends StatelessWidget {
  String title, value;
  ReuseRow({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }
}
