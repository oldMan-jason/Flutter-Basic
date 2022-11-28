import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/categorypage.dart';
import 'pages/settingpage.dart';
import 'pages/messagepage.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

/**
 * BottomNavigationBar自定义底部按钮,
 * BottomNavigationBar是Scaffold的参数
 * 类似于ios 中TabBarItem
 * 
 * 1、实现点击item切换VC,
 * 2、BottomNavigationBar常用属性使用
 * 
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var curIndex = 0;
  var pages = [HomePage(), CategoryPage(), SettingPage(), MessagePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            // item的大小
            iconSize: 28,
            // item选中的颜色
            fixedColor: Colors.purple,
            // item选中或未选中的颜色（图标+文字）
            // selectedItemColor: Colors.red,
            // unselectedItemColor: Colors.green,
            currentIndex: curIndex,
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
        appBar: AppBar(
          title: Text("Scaffold组件"),
        ),
        body: pages[curIndex]);
  }
}
