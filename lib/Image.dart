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
        appBar: AppBar(title: Text('图片')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/flutter.png'),
            Image.network('https://avatars.githubusercontent.com/u/8306792'),
            Image.network('https://avatars.githubusercontent.com/u/8306792', width: 300, repeat: ImageRepeat.repeatX),
            Image.network(
              'https://avatars.githubusercontent.com/u/8306792',
              width: 200,
            ),
            Image(image: AssetImage('assets/images/baidu.png'), width: 200),
          ],
        ));
  }
}

// Image
// - Image.new, for obtaining an image from an ImageProvider.
// - Image.asset, for obtaining an image from an AssetBundle using a key.
// - Image.network, for obtaining an image from a URL.
// - Image.file, for obtaining an image from a File.
// - Image.memory, for obtaining an image from a Uint8List.

// AssetImage

// ImageRepeat

// Image.asset
// 需要在 `pubspec.yaml` 中配置路径
