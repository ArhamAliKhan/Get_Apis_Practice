import 'dart:async';
import 'dart:convert';

import 'package:apis_practice/Models/ComplexModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PraticeCompelxJson extends StatefulWidget {
  const PraticeCompelxJson({super.key});

  @override
  State<PraticeCompelxJson> createState() => _PraticeCompelxJsonState();
}

class _PraticeCompelxJsonState extends State<PraticeCompelxJson> {
  Future<ComplexModel> getComplex() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/e2ec4641-1a1c-4c4f-ba9f-62f1d256bc46'));
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
          title: Text('PracticeComplexJson'),
          backgroundColor: Colors.blue,
        ),
        body: FutureBuilder(
            future: getComplex(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.trendingTopics.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Text(snapshot.data.trendingTopics[index].topic
                                    .toString()),
                                Text(snapshot
                                    .data.trendingTopics[index].mentions
                                    .toString()),
                              ],
                            );
                          }),
                    ),
                    Divider(),
                    Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data.directMessages.length,
                            itemBuilder: (context, position) {
                              return Column(
                                children: [
                                  Text(snapshot.data.directMessages[position]
                                      .conversationId
                                      .toString()),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot
                                          .data
                                          .directMessages[position]
                                          .participants
                                          .length,
                                      itemBuilder: (context, locat) {
                                        return Column(
                                          children: [
                                            Text(
                                              snapshot
                                                  .data
                                                  .directMessages[position]
                                                  .participants[locat]
                                                  .userId
                                                  .toString(),
                                            ),
                                            Text(
                                              snapshot.data.directMessages[0]
                                                  .participants[locat].username
                                                  .toString(),
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              );
                            })),
                    Divider(),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
