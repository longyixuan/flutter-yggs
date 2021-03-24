import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Center(
            child: Text(
              '会议室预定',
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            new Container()
          ],
        ),
        body: new Center(
          child: null,
        ),
      ),
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF046ABA)),   // 设置主题颜色
      ),
    );
  }
}