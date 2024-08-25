import 'package:apis_practice/ulta_complex_json.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ThisApp());
}

class ThisApp extends StatefulWidget {
  const ThisApp({super.key});

  @override
  State<ThisApp> createState() => _ThisAppState();
}

class _ThisAppState extends State<ThisApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UltraComplexJson(),
    );
  }
}
