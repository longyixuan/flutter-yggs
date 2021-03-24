import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
        title: Center(
          child: Text(
            '我的',
            textAlign: TextAlign.center,
          ),
        ),
        // 后面的省略
        // ......
      )),
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF046ABA)), // 设置主题颜色
      ),
    );
  }
}
