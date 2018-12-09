import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "测试手势单击，长按，双击"; //保存事件名
  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试手势单击，长按，双击'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print('object');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new _Drag();
              }));
            },
            child: Text(
              'Next',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Center(
        child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              updateText("单击");
              Fluttertoast.showToast(
                  msg: '单击',
                  toastLength: Toast.LENGTH_SHORT,
                  bgcolor: '#FFCC00',
                  gravity: ToastGravity.CENTER);
            }, //点击
            onDoubleTap: () {
              updateText("双击");
              Fluttertoast.showToast(
                  msg: '双击',
                  toastLength: Toast.LENGTH_SHORT,
                  bgcolor: '#FF3366');
            }, //双击
            onLongPress: () {
              updateText("长按");
              Fluttertoast.showToast(
                  msg: '长按',
                  toastLength: Toast.LENGTH_SHORT,
                  bgcolor: '#FF0000',
                  gravity: ToastGravity.TOP,
                  timeInSecForIos: 1);
            }),
      ),
    );
  }
}

//==============拖动滑动

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  double _topB = 60.0; //球球垂直用
  double _topC = 120.0; //球球水平用

  double _topD = 120; //球球水平用

  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拖动滑动'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("球球"),
                backgroundColor: Colors.green,
              ),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
                var dx = e.globalPosition.dx;
                var dy = e.globalPosition.dy;
                print('x:$dx ---y:$dy');
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                var dx = e.delta.dx;
                var dy = e.delta.dy;
                print('x:$dx ---y:$dy');
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                var v = e.velocity;
                print('打印滑动结束时在x、y轴上的速度 $v');
              },
            ),
          ),
          Positioned(
            top: _topB,
            child: GestureDetector(
                child: CircleAvatar(child: Text("单垂")),
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _topB += details.delta.dy;
                  });
                }),
          ),
          Positioned(
            left: _topC,
            top: _topD,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("单水"),
                backgroundColor: Colors.blue,
              ),
              //水平方向移动
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _topC += details.delta.dx;
                });
              },
            ),
          ),
          //
          Positioned(
            bottom: 0.0,
            // right: 0.0,
            child: Center(
              child: GestureDetector(
                  //指定宽度，高度自适应
                  child: Image.asset("assets/images/banner/wallpaper_2.jpg",
                      width: _width),
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    setState(() {
                      //缩放倍数在0.8到10倍之间
                      _width = 200 * details.scale.clamp(.8, 10.0);
                    });
                  }),
            ),
          )
        ],
      ),
    );
    ;
  }
}
