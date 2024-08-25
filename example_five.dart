// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import 'Models/PostModel.dart';
//
// class ExampleFive extends StatefulWidget {
//   const ExampleFive({super.key});
//
//   @override
//   State<ExampleFive> createState() => _ExampleFiveState();
// }
//
// class _ExampleFiveState extends State<ExampleFive> {

//   Basically, this is code of very complex json structure. But
//   it is not containing any any model, the apis is not true for this code.
//   This is just hawa mai hai code.

//   Future<PostModel> getApi() async {
//     final response = await http.get(
//         Uri.parse('https://webhook.site/d24f9761-dfba-4759-bcda-f42f3dd539b7'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       return PostModel.fromJson(data);
//     } else {
//       return PostModel.fromJson(data);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Complex Json'),
//         backgroundColor: Colors.blue,
//       ),
//       body: FutureBuilder(
//         future: getApi(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data!.data!.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height * .3,
//                         width: MediaQuery.of(context).size.width * .3,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: snapshot.data!.data![index].images!.length,
//                           itemBuilder: (context, position) {
//                             return Container(
//                               height: MediaQuery.of(context).size.height * .3,
//                               width: MediaQuery.of(context).size.width * .3,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(snapshot
//                                       .data!.data![index].images![position].url
//                                       .toString()),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   );
//                 });
//           } else {
//             return CircularProgressIndicator();
//           }
//         },
//       ),
//     );
//   }
// }
