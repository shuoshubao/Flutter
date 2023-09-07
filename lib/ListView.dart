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
        title: '滚动组件 ListView',
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('可以调整 itemCount 来查看效果'),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: ListView.builder(
              itemCount: 20,
              // primary: true,
              // shrinkWrap: true,
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 30,
                    color: index.isEven ? Colors.green : Colors.cyan,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text('Scrollable 2 : Index $index'),
                    ));
              }),
        ),
        Text(
          'End',
          style: TextStyle(color: Colors.red),
        ),
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