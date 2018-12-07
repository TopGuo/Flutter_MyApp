import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: NewRoute(),
    ));

class NewRoute extends StatefulWidget {
  @override
  _NewRouteState createState() => _NewRouteState();
}

class _NewRouteState extends State<NewRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新路由'),
        centerTitle: true,
      ),
      body: Container(
        child: new Text(
          '新路由context',
          textAlign: TextAlign.center,
          ),
      ),
    );
  }
}