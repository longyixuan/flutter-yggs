import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';
import 'dart:convert';
import 'dart:io';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var _ipAddress = 'Unknown';
  //用户名控制器
  TextEditingController _unameController = TextEditingController();
    //密码控制器
  TextEditingController _passwordController = TextEditingController();
  _getIPAddress() async {
    var url = 'http://172.17.5.60:3333/login';
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      Map jsonMap = {
        'userName': _unameController.text,
        'password': _passwordController.text,
        'saveLogin': true,
      };
      print('$jsonMap');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonData = await response.transform(utf8.decoder).join();
        var data = jsonDecode(jsonData);
        result = data['data']['nickName'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    
    if (!mounted) return;
    setState(() {
      _ipAddress = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset('images/logo.png'),
              new Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Text(
                  '欢迎登录：$_ipAddress',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black54
                  ),
                ),
                )
              ),
              new TextField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  prefixIcon: Icon(Icons.person)
                )
              ),
              new TextField(
                controller:  _passwordController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true,
              ),
              new RaisedButton(
                onPressed: _getIPAddress,
                child: new Text('登录'),
              ),
            ],
          ),
        ),
      ),
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF046ABA)), // 设置主题颜色
      ),
    );
  }
}
