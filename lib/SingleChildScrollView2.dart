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
        title: '滚动组件',
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
    final demos1 = new List.generate(100, (i) {
      return 'demo A $i';
    });
    final demos2 = new List.generate(100, (i) {
      var value = i * 2 + 1;
      return 'demo B $value';
    });
    return Scaffold(
        body: Column(
      children: [
        Text('滚动组件 A'),
        Container(
            height: 200,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [for (final name in demos1) Text(name)]),
              ),
            )),
        Text('滚动组件 B'),
        Container(
            height: 300,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [for (final name in demos2) Container(height: 30, child: Text(name, style: TextStyle(fontSize: 20, color: Colors.cyan)))]),
              ),
            ))
      ],
    ));
  }
}

// ListView
// PageView
// GridView
// Scrollable
// CustomScrollView
// SingleChildScrollView
// ScrollNotification
// NotificationListener