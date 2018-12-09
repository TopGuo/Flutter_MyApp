import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpTestRoute extends StatefulWidget {
  @override
  _HttpTestRouteState createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  bool _loading = false;
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpClinet 网络请求'),
        actions: <Widget>[
          FlatButton(
            child: Text('Next'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DioTestRoute();
              }));
            },
          )
        ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取百度首页"),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = "正在请求...";
                      });
                      try {
                        //创建一个HttpClient
                        HttpClient httpClient = new HttpClient();
                        //  Uri uri=Uri(scheme: "https", host: "flutterchina.club", queryParameters: {
                        //   "xx":"xx",
                        //   "yy":"dd"
                        // });
                        //打开Http连接
                        HttpClientRequest request = await httpClient
                            .getUrl(Uri.parse("https://www.baidu.com"));

                        //使用iPhone的UA
                        request.headers.add("user-agent",
                            "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");

                        //等待连接服务器（会将请求信息发送给服务器）
                        HttpClientResponse response = await request.close();

                        //读取响应内容
                        var text =
                            await response.transform(utf8.decoder).join();
                        _text = text.toString().substring(0, 100);
                        //输出响应头
                        print(response.headers);

                        //关闭client后，通过该client发起的所有请求都会中止。
                        httpClient.close();
                      } catch (e) {
                        _text = "请求失败：$e";
                        print(_text);
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
            ),
            Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")))
          ],
        ),
      ),
    );
  }
}

//==================测试dio 请求

class DioTestRoute extends StatefulWidget {
  @override
  _DioTestRouteState createState() => _DioTestRouteState();
}

class _DioTestRouteState extends State<DioTestRoute> {
  bool _loading = false;
  String _text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio 网络请求'),
        // actions: <Widget>[
        //   FlatButton(
        //     child: Text('Next'),
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return DioTestRoute();
        //       }));
        //     },
        //   )
        // ],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("获取百度首页"),
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                        _text = "正在请求...";
                      });
                      try {
                        Dio dio = new Dio();
                        Response response;
                        response = await dio.get("https://www.baidu.com");
                        print(response.data.toString());
                        _text = response.data.toString();
                        //输出响应头
                        //print(response.headers);
                      } catch (e) {
                        _text = "请求失败：$e";
                        print(_text);
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
            ),
            Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_text.replaceAll(new RegExp(r"\s"), "")))
          ],
        ),
      ),
    );
  }
}
