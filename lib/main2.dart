import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          //child: Text('Hello World'),   // Replace this text...
          child: RollingButton(), // With this text.
        ),
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    return Text(wordPair.asCamelCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class RollingButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RollingState();
  }
}

class _RollingState extends State<RollingButton> {
  final _random = Random();

  List<int> _roll() {
    return [_random.nextInt(6), _random.nextInt(6)];
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }

  void _onPressed() {
    debugPrint('_RollingState._onPressed');
    final rollResults = _roll();
    showDialog(
        // 第一个 context 是参数名，第二个 context 是 State 的成员变量
        context: context,
        builder: (_) {
          return AlertDialog(
            content:
                Text('Roll result: (${rollResults[0]}, ${rollResults[1]})'),
          );
        });
  }
}
