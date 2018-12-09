import 'package:flutter/material.dart';
import './NewRoute.dart';
import './HelloWorld.dart';
import './CounterWidget.dart';
import './imagedemo/LoadImage.dart';
import './components/TextFieldText.dart';
import './components/SingleChildScrollViewTestRoute.dart';
import './components/ListViewTesstRoute.dart';
import 'components/GestureDetectorTestRoute.dart';
//三方
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      //注册路由表
      routes: {
        "newRoute": (context) => NewRoute(),
        "loadImage": (context) => LoadImage(),
        "textFieldText": (context) => TextFieldText(),
        "singleChildScrollViewTestRoute": (context) =>
            SingleChildScrollViewTestRoute(),
        "ListViewTesstRoute": (context) => ListViewTesstRoute(),
        "GestureDetectorTestRoute":(context)=>GestureDetectorTestRoute()
      },
      home: MyHomePage(
        title: '鸟窝',
        goInfo: '99',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.goInfo}) : super(key: key);
  final String title;
  final String goInfo;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          print('1');
          Fluttertoast.showToast(
              msg: '再按一次退出应用', toastLength: Toast.LENGTH_SHORT);
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: _buildListView(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: '增加',
        //   child: Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget _buildListView() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, //纵轴三个子widget
            childAspectRatio: 6 //宽高比为1时，子widget
            ),
        children: <Widget>[
          Center(
            child: Text(
              'Flutter 学习:',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          FlatButton(
            child: Text("路由跳转"),
            textColor: Colors.blue,
            onPressed: () {
              //导航到新路由
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) {
              //   return new NewRoute();
              // }));
              Navigator.pushNamed(context, 'newRoute');
            },
          ),
          FlatButton(
            child: Text("随机字典List"),
            textColor: Colors.red,
            onPressed: () {
              //导航到新路由
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) {
                        return new HelloWorld();
                      },
                      fullscreenDialog: true));
            },
          ),
          FlatButton(
            child: Text("state声明周期"),
            textColor: Colors.black,
            onPressed: () {
              //导航到新路由
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) {
                        return new CounterWidget();
                      },
                      fullscreenDialog: true));
            },
          ),
          //
          FlatButton(
            child: Text("加载图片"),
            textColor: Colors.green,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'loadImage');
            },
          ),
          FlatButton(
            child: Text("Switch/Checked"),
            textColor: Colors.cyan,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'loadImage');
            },
          ),
          FlatButton(
            child: Text("TextField"),
            textColor: Colors.blue,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'textFieldText');
            },
          ),
          FlatButton(
            child: Text("singleChildScrollView"),
            textColor: Colors.blue,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'singleChildScrollViewTestRoute');
            },
          ),
          FlatButton(
            child: Text("ListViewTesstRoute"),
            textColor: Colors.pink,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'ListViewTesstRoute');
            },
          ),
          FlatButton(
            child: Text("简单手势识别"),
            textColor: Colors.black,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'GestureDetectorTestRoute');
            },
          ),
          FlatButton(
            child: Text("手势识别"),
            textColor: Colors.black,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'ListViewTesstRoute');
            },
          ),
          FlatButton(
            child: Text("手势识别"),
            textColor: Colors.black,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'ListViewTesstRoute');
            },
          ),
          FlatButton(
            child: Text("手势识别"),
            textColor: Colors.black,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'ListViewTesstRoute');
            },
          ),
          FlatButton(
            child: Text("手势识别"),
            textColor: Colors.black,
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, 'ListViewTesstRoute');
            },
          ),
          // FlatButton(
          //   child: Text("手势识别"),
          //   textColor: Colors.black,
          //   onPressed: () {
          //     //导航到新路由
          //     Navigator.pushNamed(context, 'ListViewTesstRoute');
          //   },
          // ),
        ]);
  }
}
