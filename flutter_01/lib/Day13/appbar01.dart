import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

/**
 * AppBar相关属性定义
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 导航条背景颜色
          backgroundColor: Colors.green,
          //导航左边按钮
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          //右侧多个按钮
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more))
          ],
          title: Text("TabBar组件"),
          // 导航标题居中展示
          centerTitle: true,
        ),
        body: Container());
  }
}
