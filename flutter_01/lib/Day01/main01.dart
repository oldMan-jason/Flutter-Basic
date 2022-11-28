import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    //根据系统区域显示不同的描述
    onGenerateTitle: (context) {
      var local = Localizations.localeOf(context);
      if (local == "zh") {
        return "我是标题";
      } else {
        return "I am title";
      }
    },

    home: Scaffold(
      appBar: AppBar(
        title: const Text("这个是标题"),
      ),
      body: const MyApp(),
    ),
  ));
}

// 自定义组件
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
