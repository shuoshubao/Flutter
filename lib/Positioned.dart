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
        title: '定位布局',
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
        body: Stack(
      children: [
        Positioned(
          left: 30,
          bottom: 30,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Cancel'),
          ),
        ),
        Positioned(
          right: 30,
          bottom: 30,
          child: FilledButton(
            onPressed: () {},
            child: Text('Submit'),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('text0'),
            Text('text1'),
            Text('text2'),
            Text('text3'),
            Text('text4'),
            Text('text5'),
            Container(
              color: Colors.cyan,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Text('text6', style: TextStyle(fontSize: 20)),
            ),
          ]),
        )
      ],
    ));
  }
}

// Stack
// Positioned