import 'package:flutter/material.dart';
import './tabstate/TapboxA.dart';
import './tabstate/TapboxB.dart';
class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue: 0});

  final int initValue;
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('initState_$_counter');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
          title: Text('state 生命周期'),
          centerTitle: true,
          leading: FlatButton(
            child: Icon(Icons.backup),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('state 生命周期$_counter'), 
              TapboxA(), 
              ParentWidget()
            ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => ++_counter),
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}
