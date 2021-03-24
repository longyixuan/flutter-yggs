import 'package:flutter/material.dart';

class NoticePageItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _NoticePageItemState();  
}
class _NoticePageItemState extends State<NoticePage> {
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
    );
  }
}