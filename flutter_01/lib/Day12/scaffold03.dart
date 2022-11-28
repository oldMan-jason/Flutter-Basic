import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

/**
 * Drawer侧边栏、不同设备调试Flutter程序
 * DrawerHeader的使用
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
            DrawerHeader(
              child: ListTile(
                title: Text("Jaosn"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/3.png"),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://www.itying.com/images/flutter/2.png"),
                      fit: BoxFit.cover)),
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
