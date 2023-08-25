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
    // var appState = context.watch();

    final onPressed = () {
      print(111);
    };

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Text('ElevatedButton'),
        ),
        SizedBox(height: 24),
        ElevatedButton.icon(
          icon: Icon(Icons.star),
          label: Text('ElevatedButton.icon'),
          onPressed: onPressed,
        ),
        SizedBox(height: 24),
        FilledButton(
          onPressed: onPressed,
          child: Text('FilledButton'),
        ),
        SizedBox(height: 24),
        OutlinedButton(
          onPressed: onPressed,
          child: Text('OutlinedButton'),
        ),
        SizedBox(height: 24),
        OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(Icons.favorite),
          label: Text('OutlinedButton'),
          style: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.red), backgroundColor: MaterialStateProperty.all(Colors.yellow)),
        ),
        SizedBox(height: 24),
        TextButton(
          onPressed: onPressed,
          child: Text('TextButton'),
        ),
        TextButton.icon(
          onPressed: onPressed,
          icon: Icon(Icons.favorite),
          label: Text('TextButton'),
        ),
      ],
    ));
  }
}

// - ElevatedButton, a filled button that doesn't elevate when pressed.
// - FilledButton, a filled button that doesn't elevate when pressed.
// - FilledButton.tonal, a filled button variant that uses a secondary fill color.
// - OutlinedButton, a button with an outlined border and no fill color.
// - TextButton, a button with no outline or fill color.