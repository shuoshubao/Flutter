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
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: appState.list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(appState.list[index]),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              appState.handleAddItem();
            },
            child: Text('增加一条'),
          ),
          ElevatedButton(
            onPressed: appState.list.length == 1
                ? null
                : () {
                    appState.handleRemoveItem();
                  },
            child: Text('删除一条'),
          ),
        ],
      ),
    );
  }
}
