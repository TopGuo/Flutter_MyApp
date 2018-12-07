import 'package:flutter/material.dart';

class LoadImage extends StatefulWidget {
  @override
  _LoadImageState createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片加载'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('本地图片'),
            Image(
              image: AssetImage("assets/images/banner/wallpaper_1.jpg"),
              width: 100.0
            ),
            Text('网络图片'),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100.0,
            ),
            Text('本地图片2'),
            Image.asset(
              "assets/images/banner/wallpaper_2.jpg",
              width: 100.0,
            ),
            Text('网络图片2'),
            Image(
              image: NetworkImage(
                  "https://www.cnblogs.com/images/cnblogs_com/gdsblog/1129111/o_topbirds_1.jpg"),
              width: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
