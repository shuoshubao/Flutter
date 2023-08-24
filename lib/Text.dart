import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  build(context) {
    return MaterialApp(
      title: 'Text',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  build(context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('没有任何样式'),
        Text(
          '居中，字号，颜色，粗细',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.cyan, fontWeight: FontWeight.bold),
        ),
        Text(
          '下划线 TextDecoration.underline',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        Text(
          '删除线 TextDecoration.lineThrough',
          textAlign: TextAlign.center,
          style: TextStyle(decoration: TextDecoration.lineThrough),
        ),
        Text(
          '上划线 TextDecoration.overline',
          style: TextStyle(decoration: TextDecoration.overline),
        ),
        SizedBox(height: 24),
        SelectableText('我是可以被复制的'),
        SizedBox(height: 24),
        Text.rich(TextSpan(text: '富文本 Text.rich(TextSpan)', children: [
          TextSpan(text: '富文本 cyan', style: TextStyle(color: Colors.cyan, fontSize: 22)),
          TextSpan(text: '富文本 deepPurple', style: TextStyle(color: Colors.deepPurple, fontSize: 18)),
          TextSpan(text: '富文本 green', style: TextStyle(color: Colors.green, fontSize: 20)),
        ])),
        SizedBox(height: 24),
        Text(List.generate(20, (index) => '文本溢出').join(''), overflow: TextOverflow.ellipsis),
        SizedBox(height: 24),
        Text(List.generate(40, (index) => '文本溢出').join(''), maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    ));
  }
}

// https://api.flutter.dev/flutter/widgets/Text-class.html

// Text
// TextSpan
// TextStyle
// TextAlign
// TextOverflow
// TextDecoration
// DefaultTextStyle
// TextDecoration
// TextDecorationStyle

// The element type 'TextSpan' can't be assigned to the list type 'Widget'.
