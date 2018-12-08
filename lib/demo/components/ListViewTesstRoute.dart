import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';;

class ListViewTesstRoute extends StatefulWidget {
  @override
  _ListViewTesstRouteState createState() => _ListViewTesstRouteState();
}

class _ListViewTesstRouteState extends State<ListViewTesstRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.list),
              onPressed: () {
                print('action');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  print(context);
                  return new InfiniteListView();
                }));
              }),
        ],
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index) {
          var iWords = index % 2 == 0 ? '偶数行' : '奇数行';
          return ListTile(title: Text("$iWords---$index"));
        },
        //分割器构造器
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        });
  }
}

//===== action 点击调转路由页面 测试list的列表加载--带上来加载的listview

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
        _words = _words;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('InfiniteListView'),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.list),
                onPressed: () {
                  print('action');
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    print(context);
                    return new GridViewTestRoute();
                  }));
                }),
          ],
        ),
        body: _buildListView());
  }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text('$index ---' + _words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: 1.0),
    );
  }
}

//===============GridView

class GridViewTestRoute extends StatefulWidget {
  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<GridViewTestRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.list),
                onPressed: () {
                  print('action');
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    print(context);
                    return new CustomScrollViewTestRoute();
                  }));
                }),
          ],
        ),
        body: _buildListView());
  }

  Widget _buildListView() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //纵轴三个子widget
            childAspectRatio: 1.1 //宽高比为1时，子widget
            ),
        children: <Widget>[
          Icon(Icons.ac_unit),
          Icon(Icons.airport_shuttle),
          Icon(Icons.all_inclusive),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
          Icon(Icons.beach_access),
          Icon(Icons.cake),
          Icon(Icons.free_breakfast),
        ]);
  }
}

//=======CustomerScroller

class CustomScrollViewTestRoute extends StatefulWidget {
  @override
  _CustomScrollViewTestRouteState createState() =>
      _CustomScrollViewTestRouteState();
}

class _CustomScrollViewTestRouteState extends State<CustomScrollViewTestRoute> {
  //@override
  // Widget build(BuildContext context) {
  //   return Material();
  // }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('自定义ScrollView'),
              background: Image.asset(
                "assets/images/banner/wallpaper_1.jpg",
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.list,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    print('action');
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      print(context);
                      return new ScrollControllerTestRoute();
                    }));
                  }),
            ],
          ),
          //
          SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 2.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    //创建子widget
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.pink[100 * (index % 9)],
                      child: new Text('grid item $index'),
                    );
                  },
                  childCount: 20,
                ),
              )),
          //
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.yellowAccent[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 30 //50个列表项
                ),
          )
        ],
      ),
    );
  }
}

//=======ListView 滚动监听

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() {
    return new ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    print('initState');
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print('offset $_controller.offset'); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.list,
                color: Colors.black,
              ),
              onPressed: () {
                print('action');
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  print(context);
                  return new ScrollNotificationTestRoute();
                }));
              }),
        ],
      ),
      body: Scrollbar(
        child: ListView.separated(
          itemCount: 100,
          //itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          separatorBuilder: (context, index) => Divider(height: 1.0),
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }
}

//=====Notification 监听

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('滚动监听'),
          centerTitle: true,
        ),
        body: buildNotification());
  }

  Widget buildNotification() {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          //求百分比 metrics 该属性包含当前ViewPort及滚动位置等信息
          //pixels：当前滚动位置 maxScrollExtent ：最大可滚动长度
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.separated(
                itemCount: 100,
                //itemExtent: 50.0,
                separatorBuilder: (context, index) => Divider(height: 1.0),
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text("$index"),
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return new AlertDialog(
                                title: new Text('点击 $index！'),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text('确定'),
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                  ),
                                  new FlatButton(
                                    child: new Text('取消'),
                                    onPressed: () {
                                      Navigator.of(context).pop(false);
                                    },
                                  )
                                ],
                              );
                            });
                      },
                      subtitle: new Text(
                        '在线',
                        style: new TextStyle(
                            fontStyle: FontStyle.italic, color: Colors.green),
                      ),
                      leading: const Icon(Icons.face),
                      trailing: new RaisedButton(
                        child: new Text(
                          '移除',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          deleteDialog(context).then((value) {
                            print('Value is $value');
                          });
                        },
                      ));
                }),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}

//=======封装一个dialog
Future<bool> deleteDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('你确定要删除吗?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('确定'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            new FlatButton(
              child: new Text('在想想'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        );
      });
}
