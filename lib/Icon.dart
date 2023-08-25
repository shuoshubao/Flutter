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
        title: 'Text',
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('图标')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30.0,
            ),
            Icon(
              Icons.audiotrack,
              color: Colors.green,
              size: 50.0,
            ),
            Icon(
              Icons.beach_access,
              color: Colors.blue,
              size: 100.0,
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                print(123);
              },
              tooltip: '提示文案',
            )
          ],
        ));
  }
}

// - Icon
// - IconButton
// https://material.io/tools/icons/
// https://api.flutter.dev/flutter/widgets/Icon-class.html
// https://api.flutter.dev/flutter/material/IconButton-class.html