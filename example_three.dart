import 'dart:async';
import 'dart:convert';

import 'package:apis_practice/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  // This the code of Complex Json in which we create the model from puggins.

  List<UserModel> getList = [];
  Future<List<UserModel>> getApis() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        getList.add(UserModel.fromJson(i));
      }
      return getList;
    } else {
      return getList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complex Apis'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getApis(),
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: getList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      ReuseRow(
                        title: 'Name',
                        value: getList[index].name.toString(),
                      ),
                      ReuseRow(
                        title: 'UserName',
                        value: snapshot.data![index].username.toString(),
                      ),
                      ReuseRow(
                        title: 'Email',
                        value: snapshot.data![index].email.toString(),
                      ),
                      ReuseRow(
                        title: 'Name',
                        value: snapshot.data![index].name.toString(),
                      ),
                      ReuseRow(
                        title: 'City',
                        value: snapshot.data![index].address!.city.toString(),
                      ),
                      ReuseRow(
                        title: 'Lat',
                        value:
                            snapshot.data![index].address!.geo!.lat.toString(),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
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
        Text(title),
        Spacer(),
        Text(value),
      ],
    );
  }
}
