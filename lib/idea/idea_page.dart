import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';

class IdeaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _IdeaPageState();
}

class _IdeaPageState extends State<IdeaPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: Center(
            child: Text(
              '会议室预定',
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[new Container()],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: '未开始',
              ),
              Tab(
                text: '已结束',
              ),
              Tab(
                text: '已取消',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[Text('未开始'), Text('已结束'), Text('已取消')],
        ),
      ),
    );
  }
}
