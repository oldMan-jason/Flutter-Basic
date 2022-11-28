import 'package:flutter/material.dart';
import './pages/tabbarhome.dart';
import './../Day12/pages/categorypage.dart';
import './../Day12/pages/settingpage.dart';
import './../Day12/pages/messagepage.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

/**
 * bottomNavigationBar中添加TabBar,因为共用的body参数，
 * 所以在自定义page组件中嵌套一个Scaffold组件
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Widget> list = [
    TabBarHomePage(),
    CategoryPage(),
    SettingPage(),
    MessagePage()
  ];

  var curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 导航标题
        title: Text("TabBar组件"),
        // 导航标题居中展示
        centerTitle: true,
      ),
      body: list[curIndex],
      // 底部的item
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          // item个数超过3个需要设置type
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              curIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "首页",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "分类",
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: "设置",
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              label: "消息",
              icon: Icon(Icons.message),
            ),
          ]),
    );
  }
}
