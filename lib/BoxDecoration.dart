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
        title: 'BoxDecoration',
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
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('可以调整 itemCount 来查看效果'),
        DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.red, width: 10)),
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 100),
              child: Text(
                '装饰器 DecoratedBox',
                style: TextStyle(color: Colors.purple),
              )),
        ),
        Text('1: BorderRadius.circular(20)'),
        Text('2: BorderRadius.all(Radius.circular(20)'),
        Text(
            '3: BorderRadius.only( topLeft: Radius.circular(30), topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(30))'),
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(20)),
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                  child: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                  child: Text(
                    '2',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(30))),
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                  child: Text(
                    '3',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        Text('阴影 boxShadow'),
        SizedBox(height: 24),
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.cyan,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple,
                    blurRadius: 4,
                    offset: Offset(4, -8), // Shadow position
                  ),
                ],
              ),
              child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 100, minWidth: 100),
                  child: Text(
                    '1',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ],
    ));
  }
}

// BoxDecoration