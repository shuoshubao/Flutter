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
        title: 'Checkbox Radio Switch Slider',
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

  var amount = 3;
  void handleChangeAmount(value) {
    amount = value.toInt();
    notifyListeners();
  }

  var multiSelected = ['apple', 'orange', 'banana'];
  void handleMultiSelected(value, selected) {
    // multiSelected = value;
    if (selected) {
      multiSelected.add(value);
    } else {
      multiSelected.remove(value);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    var selected = appState.selected;
    var handleToggle = appState.handleToggle;

    var amount = appState.amount;
    var handleChangeAmount = appState.handleChangeAmount;

    var multiSelected = appState.multiSelected;
    var handleMultiSelected = appState.handleMultiSelected;

    return Scaffold(
        appBar: AppBar(title: Text('Checkbox Radio Switch Slider')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              Text('开关 A'),
              Switch(
                value: selected,
                onChanged: (value) {
                  handleToggle();
                },
              ),
            ]),
            Row(children: [
              Text('开关 B'),
              Switch(
                value: !selected,
                onChanged: (value) {
                  handleToggle();
                },
              ),
            ]),
            SizedBox(height: 20),
            Switch(
              value: selected,
              onChanged: (value) {
                handleToggle();
              },
              activeColor: Colors.red,
              // focusColor: Colors.green,
              // hoverColor: Colors.purple,
            ),
            SizedBox(height: 24),
            Checkbox(
                value: selected,
                onChanged: (value) {
                  handleToggle();
                }),
            SizedBox(height: 24),
            Slider(
              value: amount.toDouble(),
              onChanged: handleChangeAmount,
              min: 0,
              max: 20,
            ),
            Slider(
              value: amount.toDouble(),
              onChanged: handleChangeAmount,
              min: 0,
              max: 20,
              divisions: 10, // 刻度数量
            ),
            Text.rich(TextSpan(text: 'Slider value: ', children: [
              TextSpan(text: (amount).toString(), style: TextStyle(color: Colors.deepPurple, fontSize: 18)),
            ])),
            CheckboxListTile(
              value: selected,
              onChanged: (value) {
                handleToggle();
              },
              title: Text('CheckboxListTile'),
            ),
            SizedBox(height: 24),
            CheckboxListTile(
              value: multiSelected.contains('apple'),
              onChanged: (value) {
                handleMultiSelected('apple', value);
              },
              title: Text('Apple'),
            ),
            CheckboxListTile(
              value: multiSelected.contains('orange'),
              onChanged: (value) {
                handleMultiSelected('orange', value);
              },
              title: Text('Orange'),
            ),
            CheckboxListTile(
              value: multiSelected.contains('banana'),
              onChanged: (value) {
                handleMultiSelected('banana', value);
              },
              title: Text('Banana'),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Multi selected: '),
              TextSpan(text: multiSelected.toString()),
            ])),
            SizedBox(height: 24),
            SwitchListTile(
                value: selected,
                onChanged: (value) {
                  handleToggle();
                }),
            SwitchListTile(
                value: selected,
                onChanged: (value) {
                  handleToggle();
                },
                title: Text('SwitchListTile')),
            SwitchListTile(
              value: selected,
              onChanged: (value) {
                handleToggle();
              },
              title: Text('SwitchListTile'),
              subtitle: Text(List.generate(10, (index) => '文字很多').join('')),
            ),
            SwitchListTile(
              value: selected,
              onChanged: (value) {
                handleToggle();
              },
              title: Text('SwitchListTile'),
              subtitle: Text(List.generate(20, (index) => '文字很多').join('')),
              isThreeLine: true,
            ),
            SizedBox(height: 24),
          ],
        ));
  }
}

// Switch
// Checkbox
// Radio
// Slider

// SwitchListTile, A ListTile with a Switch. In other words, a switch with a label.
// CheckboxListTile, a similar widget for checkboxes.
// RadioListTile, a similar widget for radio buttons.
// ListTileTheme, which can be used to affect the style of list tiles, including switch list tiles.