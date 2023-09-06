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
        title: 'Form',
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
        appBar: AppBar(title: Text('TextField')),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "用户名", hintText: "用户名或邮箱", prefixIcon: Icon(Icons.person, color: Colors.pink)),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: "密码", hintText: "您的登录密码", prefixIcon: Icon(Icons.lock)),
          ),
        ]));
  }
}

// TextField
// InputDecoration
// OutlineInputBorder