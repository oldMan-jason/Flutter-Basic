import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

/**
 * Drawer侧边栏、不同设备调试Flutter程序
 * UserAccountsDrawerHeader 系统固定样式的头部视图
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
        //左侧抽屉组件
        drawer: Drawer(
            child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.itying.com/images/flutter/1.png"),
                      fit: BoxFit.cover)),
              accountName: Text("jasonshao"),
              accountEmail: Text("xxxxxx@qq.com"),
              // 用户头像
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/5.png")),
              // 有侧的功能按钮
              otherAccountsPictures: [
                Icon(Icons.home),
                Icon(Icons.category),
                Icon(Icons.settings)
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.home),
              ),
              title: Text("首页"),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.category),
              ),
              title: Text("分类"),
            )
          ],
        )),
        appBar: AppBar(
          title: Text("Drawer组件"),
        ),
        body: Container());
  }
}
