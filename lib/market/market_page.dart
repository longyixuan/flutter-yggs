import 'package:flutter/material.dart';
import 'package:yggs/component/color.dart';
import 'package:video_player/video_player.dart';

class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final String VIDEO_URL = 'https://www.runoob.com/try/demo_source/mov_bbb.mp4';
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(VIDEO_URL);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: Center(
            child: Text(
              '全部会议',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: new Center(
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  print(snapshot.connectionState);
                  if (snapshot.hasError) print(snapshot.error);
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      // aspectRatio: 16 / 9,
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              RaisedButton(
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
              )
            ]
          )
        )
      ),
      theme: new ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF046ABA)), // 设置主题颜色
      ),
    );
  }
}
