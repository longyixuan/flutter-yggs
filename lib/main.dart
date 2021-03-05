import 'package:flutter/material.dart';
import 'package:yggs/index/index.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;//打包
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
