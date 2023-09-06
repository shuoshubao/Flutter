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
        body: Wrap(children: [
      Column(
        children: [
          SizedBox(
            height: 24,
            child: Text('Row 会溢出'),
          ),
          Row(
            children: [
              Text(List.generate(20, (index) => '文本溢出').join('')),
            ],
          ),
          SizedBox(
            height: 24,
            child: Text('Wrap 换行'),
          ),
          Wrap(children: [Text(List.generate(20, (index) => '文本溢出').join(''))]),
          Wrap(spacing: 8, runSpacing: 18, children: [Text('文字1啊'), Text('文字2啊'), Text('文字3啊'), Text('文字4啊'), Text('A widget that displays its children in a one-dimensional array.')]),
          Text('垂直方向溢出不会报错 s'),
          Text('第0行'),
          Text('第1行'),
          Text('第2行'),
          Text('第3行'),
          Text('第4行'),
          Text('第5行'),
          Text('第6行'),
          Text('第7行'),
          Text('第8行'),
          Text('第9行'),
          Text('第10行'),
          Text('第11行'),
          Text('第12行'),
          Text('第13行'),
          Text('第14行'),
          Text('第15行'),
          Text('第16行'),
          Text('第17行'),
          Text('第18行'),
          Text('第19行'),
          Text('第20行'),
        ],
      )
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
