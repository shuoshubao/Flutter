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
        title: 'OkToast',
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
        appBar: AppBar(title: Text('OkToast')),
        body: OKToast(
            dismissOtherOnShow: true,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  showToast('普通文本');
                },
                child: Text('普通文本'),
              ),
              ElevatedButton(
                onPressed: () {
                  showToast('普通文本 position:top', position: ToastPosition.top);
                },
                child: Text('普通文本 position'),
              ),
              ElevatedButton(
                onPressed: () {
                  showToast('样式: textPadding + radius', radius: 20, textPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24));
                },
                child: Text('样式: textPadding + radius'),
              ),
              ElevatedButton(
                onPressed: () {
                  showToast('背景色 + 文字样式', backgroundColor: Colors.green, textStyle: TextStyle(color: Colors.orange, fontSize: 20));
                },
                child: Text('背景色 + 文字样式'),
              ),
              ElevatedButton(
                onPressed: () {
                  showToastWidget(Text('showToastWidget', style: TextStyle(color: Colors.cyan, fontSize: 20)), position: ToastPosition.bottom);
                },
                child: Text('showToastWidget'),
              ),
              ElevatedButton(
                onPressed: () {
                  showToastWidget(Text('showToastWidget', style: TextStyle(color: Colors.cyan, fontSize: 20, backgroundColor: Colors.black.withAlpha(80))), position: ToastPosition.top);
                },
                child: Text('showToastWidget'),
              ),
            ])));
  }
}

// oktoast
// showToast
// showToastWidget