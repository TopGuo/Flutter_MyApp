import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  // @override
  // Widget build(BuildContext context){
  //   return Container();
  // }
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.end,
            //动态创建一个List<Widget>
            children: str
                .split("")
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Material(
                      child: Text(c,
                          textScaleFactor: 1.0,
                          style: TextStyle(
                              //decoration: TextDecoration.none,
                              color: Colors.green,
                              fontSize: 60.0)),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
