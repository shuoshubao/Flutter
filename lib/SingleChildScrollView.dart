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
    final demos = new List.generate(100, (i) {
      return 'demo $i';
    });
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [for (final name in demos) Text(name)]),
      ),
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