import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

/**
 * BottomNavigationBar自定义底部按钮,
 * BottomNavigationBar是Scaffold的参数
 * 类似于ios 中TabBarItem
 * 
 * 实现点击item进行切换
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: curIndex,
            onTap: (index) {
              setState(() {
                curIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: "首页",
                icon: Icon(Icons.home),
                // activeIcon: Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                label: "系统",
                icon: Icon(Icons.synagogue_sharp),
                // activeIcon: Icon(Icons.bolt),
              ),
              BottomNavigationBarItem(
                label: "设置",
                icon: Icon(Icons.settings),
                // activeIcon: Icon(Icons.cabin),
              ),
            ]),
        appBar: AppBar(
          title: Text("Scaffold组件"),
        ),
        body: Container());
  }
}
