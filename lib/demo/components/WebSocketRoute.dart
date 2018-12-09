import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketRoute extends StatefulWidget {
  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = "";
  @override
  void initState() {
    super.initState();
    //创建websocket连接
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WebSocket(内容回显)'),
        ),
        body: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Form(
                  child: new TextFormField(
                    controller: _controller,
                    decoration:
                        new InputDecoration(labelText: '发送消息'),
                  ),
                ),
                new StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snapshot) {
                    //网络不通会走到这
                    if (snapshot.hasError) {
                      _text = "网络不通...";
                    } else if (snapshot.hasData) {
                      _text = "echo: " + snapshot.data;
                    }
                    return new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: new Text(_text),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _sendMessage,
          tooltip: '发送',
          child: new Icon(Icons.send),
        ));
  }
}
