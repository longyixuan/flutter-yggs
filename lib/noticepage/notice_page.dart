import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';
class NoticePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _NoticePageState();
}
class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('消息'),
          // 后面的省略
          // ......
        )
      ),
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF046ABA)),   // 设置主题颜色
      ),
    );
  }
}