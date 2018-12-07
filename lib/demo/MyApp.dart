import 'package:flutter/material.dart';
import './NewRoute.dart';
import './HelloWorld.dart';
import './CounterWidget.dart';
import './imagedemo/LoadImage.dart';
import './components/TextFieldText.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink),
      //注册路由表
      routes: {
        "newRoute": (context) => NewRoute(),
        "loadImage": (context) => LoadImage(),
        "textFieldText":(context)=>TextFieldText()
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String goInfo;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter 学习:',
              style: Theme.of(context).textTheme.display1,
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
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: '增加',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
