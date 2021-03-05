import 'package:flutter/material.dart';
import 'package:yggs/index/index.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '会议室预定',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Index(),
    );
  }
}
