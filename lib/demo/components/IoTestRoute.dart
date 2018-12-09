import 'package:flutter/material.dart';

class IoTestRoute extends StatefulWidget {
  @override
  _IoTestTouteState createState() => _IoTestTouteState();
}

class _IoTestTouteState extends State<IoTestRoute> {
  var textInputInfo = "文件无内容";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Io 读写'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   children: <Widget>[
              //     RaisedButton(
              //       child: Text('保存'),
              //       onPressed: () {
              //         //读取从文件夹
              //         print('保存');
              //       },
              //     ),
              //     // TextField(
              //     //     autofocus: true,
              //     //     decoration: InputDecoration(
              //     //         hintText: "输入内容",
              //     //         labelStyle: TextStyle(color: Colors.green))),
              //   ],
              // ),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text('读取'),
                    onPressed: () {
                      //读取从文件夹
                      print('读取从文件夹');
                    },
                  ),
                  Text(textInputInfo)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
