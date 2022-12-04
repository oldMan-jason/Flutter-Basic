import 'package:flutter/material.dart';
import 'game.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  通过StreamBuilder 和 AnimatedBuilder 实现数字小游戏
 */
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义小游戏"),
      ),
      body: GamePage(),
    );
  }
}
