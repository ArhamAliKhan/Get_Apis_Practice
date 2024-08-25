import 'dart:async';
import 'dart:convert';

import 'package:apis_practice/Models/ComplexModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexJsonExample extends StatefulWidget {
  const ComplexJsonExample({super.key});

  @override
  State<ComplexJsonExample> createState() => _ComplexJsonExampleState();
}

class _ComplexJsonExampleState extends State<ComplexJsonExample> {
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
        title: Text('Complex Model'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getComplex(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                    snapshot.data.platform.name.toString(),
                  ),
                  Text(
                    snapshot.data.platform.launchedYear.toString(),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.platform!.features!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(snapshot.data!.platform!.features![index]),
                            ],
                          );
                        }),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.users!.length,
                        itemBuilder: (context, position) {
                          return Column(
                            children: [
                              Text(snapshot.data!.users![position].id
                                  .toString()),
                              Text(snapshot.data!.users![position].username
                                  .toString()),
                              Text(snapshot.data!.users![position].email
                                  .toString()),
                            ],
                          );
                        }),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.users!.length,
                      itemBuilder: (context, area) {
                        return Column(
                          children: [
                            Text(snapshot.data!.users![area].profile!.fullName
                                .toString()),
                            Text(snapshot.data!.users![area].profile!.bio
                                .toString()),
                            Text(snapshot
                                .data!.users![area].profile!.profilePicture
                                .toString()),
                          ],
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.users!.length,
                      itemBuilder: (context, location) {
                        return Column(
                          children: [
                            Text(snapshot
                                .data!.users![location].profile!.location!.city
                                .toString()),
                            Text(snapshot.data!.users![location].profile!
                                .location!.country
                                .toString()),
                          ],
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          snapshot.data.users[0].posts[0].comments.length,
                      itemBuilder: (context, indexx) {
                        return Column(
                          children: [
                            Text(snapshot.data!.users![indexx].posts![indexx]
                                .comments![indexx].commentId
                                .toString()),
                            Text(snapshot.data!.users![indexx].posts![indexx]
                                .comments![indexx].userId
                                .toString()),
                            Text(snapshot.data!.users![indexx].posts![indexx]
                                .comments![indexx].username
                                .toString()),
                            Text(snapshot.data!.users![indexx].posts![indexx]
                                .comments![indexx].text
                                .toString()),
                            Text(snapshot.data!.users![indexx].posts![indexx]
                                .comments![indexx].timestamp
                                .toString()),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
