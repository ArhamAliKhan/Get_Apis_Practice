import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/ComplexModel.dart';

class UltraComplexJson extends StatefulWidget {
  const UltraComplexJson({super.key});

  @override
  State<UltraComplexJson> createState() => _UltraComplexJsonState();
}

class _UltraComplexJsonState extends State<UltraComplexJson> {
//   This the json structure of very compplex json structure
  // {
  // "platform": {
  // "name": "Social Connect",
  // "launchedYear": 2020,
  // "features": [
  // "Posts",
  // "Comments",
  // "Likes",
  // "Messages",
  // "Notifications"
  // ]
  // },
  // "users": [
  // {
  // "id": 1,
  // "username": "arham123",
  // "email": "arham123@example.com",
  // "profile": {
  // "fullName": "Arham Ali",
  // "bio": "Flutter Developer | Tech Enthusiast",
  // "profilePicture": "https://example.com/profiles/arham123.jpg",
  // "location": {
  // "city": "Karachi",
  // "country": "Pakistan"
  // }
  // },
  // "friends": [
  // {
  // "userId": 2,
  // "username": "ahmed456"
  // },
  // {
  // "userId": 3,
  // "username": "sara789"
  // }
  // ],
  // "posts": [
  // {
  // "postId": "post101",
  // "timestamp": "2024-08-20T10:30:00Z",
  // "content": {
  // "text": "Just started learning Flutter, loving it!",
  // "media": {
  // "type": "image",
  // "url": "https://example.com/posts/post101.jpg"
  // }
  // },
  // "likes": [
  // {
  // "userId": 2,
  // "username": "ahmed456"
  // },
  // {
  // "userId": 4,
  // "username": "zohaib001"
  // }
  // ],
  // "comments": [
  // {
  // "commentId": "comment201",
  // "userId": 3,
  // "username": "sara789",
  // "text": "That's awesome! Keep it up.",
  // "timestamp": "2024-08-20T11:00:00Z"
  // },
  // {
  // "commentId": "comment202",
  // "userId": 5,
  // "username": "faraz900",
  // "text": "I'm learning too, it's a great framework.",
  // "timestamp": "2024-08-20T11:15:00Z"
  // }
  // ]
  // },
  // {
  // "postId": "post102",
  // "timestamp": "2024-08-21T14:45:00Z",
  // "content": {
  // "text": "Does anyone have experience with Firebase?",
  // "media": null
  // },
  // "likes": [],
  // "comments": []
  // }
  // ]
  // },
  // {
  // "id": 2,
  // "username": "ahmed456",
  // "email": "ahmed456@example.com",
  // "profile": {
  // "fullName": "Ahmed Khan",
  // "bio": "Data Scientist | AI Enthusiast",
  // "profilePicture": "https://example.com/profiles/ahmed456.jpg",
  // "location": {
  // "city": "Lahore",
  // "country": "Pakistan"
  // }
  // },
  // "friends": [
  // {
  // "userId": 1,
  // "username": "arham123"
  // },
  // {
  // "userId": 3,
  // "username": "sara789"
  // }
  // ],
  // "posts": []
  // }
  // ],
  // "trendingTopics": [
  // {
  // "topic": "#Flutter",
  // "mentions": 15000
  // },
  // {
  // "topic": "#AI",
  // "mentions": 12000
  // },
  // {
  // "topic": "#TechTrends",
  // "mentions": 8000
  // }
  // ],
  // "directMessages": [
  // {
  // "conversationId": "conv001",
  // "participants": [
  // {
  // "userId": 1,
  // "username": "arham123"
  // },
  // {
  // "userId": 2,
  // "username": "ahmed456"
  // }
  // ],
  // "messages": [
  // {
  // "messageId": "msg101",
  // "senderId": 1,
  // "text": "Hey Ahmed, how's your AI project going?",
  // "timestamp": "2024-08-19T09:15:00Z"
  // },
  // {
  // "messageId": "msg102",
  // "senderId": 2,
  // "text": "Hi Arham, it's going great! How about your Flutter learning?",
  // "timestamp": "2024-08-19T09:17:00Z"
  // }
  // ]
  // }
  // ]
  // }

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
        title: Text('Ultra Complex Json'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: getComplex(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.users.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.users[index].posts.length,
                            itemBuilder: (context, position) {
                              return Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data.users[index]
                                          .posts[position].comments.length,
                                      itemBuilder: (context, location) {
                                        return Column(
                                          children: [
                                            Divider(),
                                            Text(snapshot
                                                .data
                                                .users[index]
                                                .posts[position]
                                                .comments[location]
                                                .commentId
                                                .toString()),
                                            Text(snapshot
                                                .data
                                                .users[index]
                                                .posts[position]
                                                .comments[location]
                                                .userId
                                                .toString()),
                                            Text(snapshot
                                                .data
                                                .users[index]
                                                .posts[position]
                                                .comments[location]
                                                .username
                                                .toString()),
                                            Text(snapshot
                                                .data
                                                .users[index]
                                                .posts[position]
                                                .comments[location]
                                                .text
                                                .toString()),
                                            Text(snapshot
                                                .data
                                                .users[index]
                                                .posts[position]
                                                .comments[location]
                                                .timestamp
                                                .toString()),
                                          ],
                                        );
                                      })
                                ],
                              );
                            })
                      ],
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
