import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Dio dio = Dio();

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
        title: 'Dio',
        theme: ThemeData(useMaterial3: true),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var mdData = {};
  var selectedKey = '';

  void handleUpdateMdData(data) {
    mdData = data;
    notifyListeners();
  }

  void handleUpdateSelectedKey(key) {
    selectedKey = key;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    final keyList = appState.mdData.keys.toList();

    final selectList = appState.mdData[appState.selectedKey] ?? [];

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
            onPressed: () async {
              String url =
                  'https://raw.githubusercontent.com/shuoshubao/blog/master/store/data.json';
              final response = await dio.get(url);
              final res = jsonDecode(response.data);
              appState.handleUpdateMdData(res);
            },
            child: const Text('请求数据')),
        const SizedBox(
          height: 24,
        ),
        Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: keyList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = keyList[index];
                  final count = appState.mdData[item].length ?? 0;
                  final countText = '($count)';
                  final String text = [
                    index + 1,
                    [item, countText].join(' ')
                  ].join(': ');
                  return ElevatedButton(
                      onPressed: () {
                        appState.handleUpdateSelectedKey(item);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                        backgroundColor: appState.selectedKey == item
                            ? MaterialStatePropertyAll<Color>(Colors.orange)
                            : MaterialStatePropertyAll<Color>(Colors.purple),
                      ),
                      child: Text(text));
                })),
        Text('文章列表:'),
        Container(
          child: ListView.builder(
              itemCount: selectList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final item = selectList[index];
                final name = item['name'];
                final title = item['title'];
                return Text([index + 1, name, title].join(': '));
              }),
        )
      ],
    ));
  }
}

// BoxDecoration