import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: Center(
            child: Text(
              '会议室预定',
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[new Container()],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget> [
              UserAccountsDrawerHeader(
                accountName: Text('尹晓龙'),
                accountEmail: Text('yinxl@chsi.com.cn'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                  'https://t1.chei.com.cn/news/img/1945855235.jpg'),
                ),
                decoration: BoxDecoration(
                  // 设置背景图片
                  image: DecorationImage(
                  // 控制图片填充效果
                  fit: BoxFit.fill,
                  // 指定图片地址
                  image: NetworkImage(
                    'http://www.liulongbin.top:3005/images/bg1.jpg'
                  )
                  )
                ),
              ),
              ListTile(
                title: Text('用户反馈'),
                trailing: Icon(Icons.feedback),
              ),
              ListTile(
                title: Text('系统设置'),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text('我要发布'),
                trailing: Icon(Icons.send),
              ),
              Divider(),
              ListTile(
                title: Text('注销'),
                trailing: Icon(Icons.exit_to_app),
              ),
            ]
          ),
        ),
        body: new Center(
          child: null,
        ),
      ),
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF046ABA)), // 设置主题颜色
      ),
    );
  }
}
