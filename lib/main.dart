import 'package:english_words/english_words.dart';
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
        title: 'Namer',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var list = [WordPair.random().asLowerCase];

  void handleAddItem() {
    list.add(WordPair.random().asLowerCase);
    notifyListeners();
  }

  void handleRemoveItem() {
    if (list.isNotEmpty) {
      list.removeLast();
      notifyListeners();
    }
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    print(appState.list);

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: appState.list
                .map((value) => Text(
                      value,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.cyan, fontSize: 20),
                    ))
                .toList()),
        floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: appState.list.length == 1
                ? null
                : () {
                    appState.handleRemoveItem();
                  },
            tooltip: 'Decrease Counter',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            height: 12,
          ),
          FloatingActionButton(
            onPressed: () {
              appState.handleAddItem();
            },
            child: Icon(Icons.add),
            tooltip: 'Increment Counter',
          ),
        ]));
  }
}
