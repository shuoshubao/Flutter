import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
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
        title: 'Text',
        theme: ThemeData(useMaterial3: true),
        home: OKToast(child: MyHomePage()),
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
        appBar: AppBar(title: Text('TextField')),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[
          ElevatedButton(
            onPressed: () {
              showToast('普通文本', radius: 20.0);
            },
            child: Text('普通文本'),
          ),
          ElevatedButton(
            onPressed: () {
              showToastWidget(Text('富文本123'));
            },
            child: Text('富文本'),
          ),
        ]));
  }
}

// TextField
// InputDecoration
// OutlineInputBorder