import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/ComplexModel.dart';

class SecondComplex extends StatefulWidget {
  const SecondComplex({super.key});

  @override
  State<SecondComplex> createState() => _SecondComplexState();
}

class _SecondComplexState extends State<SecondComplex> {
  Future<ComplexModel> getComplex() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/3f66fe92-b2e0-4b19-bb3d-8691a377bbbb'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ComplexModel.fromJson(data);
    } else {
      return ComplexModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Conplex Json'),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
            future: getComplex(),
            builder: (complex, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount:
                        snapshot.data!.directMessages![0].messages!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(snapshot.data!.directMessages![0]
                              .messages![index].messageId
                              .toString()),
                          Text(snapshot.data!.directMessages![0]
                              .messages![index].senderId
                              .toString()),
                          Text(snapshot
                              .data!.directMessages![0].messages![index].text
                              .toString()),
                          Text(snapshot.data!.directMessages![0]
                              .messages![index].timestamp
                              .toString()),
                        ],
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
