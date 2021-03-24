import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';
class IdeaPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _IdeaPageState();
}
class _IdeaPageState extends State<IdeaPage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('我的会议'),
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