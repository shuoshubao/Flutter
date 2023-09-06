import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: '布局',
        theme: ThemeData(useMaterial3: true),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var selected = true;
  void handleToggle() {
    selected = !selected;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      Row(
        children: [Text('第1行')],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('第2行')],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text('第3行')],
      ),
      Row(
        children: [
          Text(
            '第4行 a',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            width: 12,
          ),
          Text('第4行 b')
        ],
      ),
      SizedBox(
        height: 24,
      ),
      Row(
        children: [
          Text(
            '第5行',
            style: TextStyle(backgroundColor: Colors.cyan),
          )
        ],
      ),
      Flex(direction: Axis.horizontal, children: [
        Expanded(
            flex: 2,
            child: Container(
              height: 20,
              color: Colors.red,
              child: Text('flex 2', style: TextStyle(color: Colors.white)),
            )),
        Expanded(
            flex: 5,
            child: Container(
              height: 30,
              color: Colors.green,
              child: Text('flex 5', style: TextStyle(color: Colors.white)),
            )),
        Expanded(
            flex: 3,
            child: Container(
              height: 40,
              color: Colors.blue,
              child: Text('flex 3', style: TextStyle(color: Colors.white)),
            ))
      ]),
      SizedBox(
        height: 24,
        child: Text('顶部对齐'),
      ),
      Flex(direction: Axis.horizontal, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            flex: 2,
            child: Container(
              height: 20,
              color: Colors.red,
              child: Text('flex 2', style: TextStyle(color: Colors.white)),
            )),
        Expanded(
            flex: 5,
            child: Container(
              height: 30,
              color: Colors.green,
              child: Text('flex 5', style: TextStyle(color: Colors.white)),
            )),
        Expanded(
            flex: 3,
            child: Container(
              height: 40,
              color: Colors.blue,
              child: Text('flex 3', style: TextStyle(color: Colors.white)),
            ))
      ]),
      SizedBox(
        height: 24,
        child: Text('纵向 Axis.vertical'),
      ),
      Container(
        height: 300,
        width: double.infinity,
        alignment: Alignment.topLeft,
        color: Colors.orange,
        child: Flex(direction: Axis.vertical, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 20,
                color: Colors.red,
                child: Text('flex 2', style: TextStyle(color: Colors.white)),
              )),
          Expanded(
              flex: 5,
              child: Container(
                height: 30,
                color: Colors.green,
                child: Text('flex 5 加点文本', style: TextStyle(color: Colors.white)),
              )),
          Expanded(
              flex: 3,
              child: Container(
                height: 40,
                color: Colors.blue,
                child: Text('flex 3', style: TextStyle(color: Colors.white)),
              ))
        ]),
      ),
      SizedBox(
        height: 24,
        child: Text('纵向-右对齐'),
      ),
      Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        // alignment: Alignment.topLeft,
        color: Colors.cyan,
        child: Flex(direction: Axis.vertical, crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 20,
                color: Colors.red,
                child: Text('flex 2', style: TextStyle(color: Colors.white)),
              )),
          Expanded(
              flex: 5,
              child: Container(
                height: 30,
                color: Colors.green,
                child: Text('flex 5 加点文本', style: TextStyle(color: Colors.white)),
              )),
          Expanded(
              flex: 3,
              child: Container(
                height: 40,
                color: Colors.blue,
                child: Text('flex 3', style: TextStyle(color: Colors.white)),
              ))
        ]),
      ),
    ]));
  }
}

// BoxConstraints
// ConstrainedBox
// SizedBox

// Column
// Row

// Flex

// Wrap
// Flow

// Stack
// Positioned
