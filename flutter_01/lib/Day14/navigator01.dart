import 'package:flutter/material.dart';
import 'pages/detailpage02.dart';
import 'pages/detailpage01.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

/**
 * 普通路由组件跳转和传值
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
          title: Text("路由组件"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 路由跳转
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DetailPage();
                    }));
                  },
                  icon: Icon(Icons.skip_next),
                  label: Text("普通跳转")),
              // 路由跳转传参数
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DetailPushPage(Id: "参数ID== 1100");
                    }));
                  },
                  icon: Icon(Icons.skip_next),
                  label: Text("跳转传参")),
            ],
          ),
        ));
  }
}
