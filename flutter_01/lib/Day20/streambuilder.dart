import 'dart:math';

import 'package:flutter/material.dart';

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
 * StreamBuilderd 实现一个计时器
 * 1、实现局部刷新 
 * 2、读取流实现读取文件或者下载网络资源等操作 
 * 3、父子组件之间的数据广播
 */
class _MyAppState extends State<MyApp> {
  final number = 0;
  // 创建数据流
  Stream<int> loadStreamData() {
    return Stream.periodic(Duration(seconds: 1), (val) {
      //模拟数据状态
      if (!Random().nextBool()) {
        throw "这个是一个模拟的异常装填";
      }
      return val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StreamBuilder"),
        ),
        body: StreamBuilder(
          stream: loadStreamData(), //绑定一个流
          // 流状态的回调
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text(
                    "没有数据流",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "等待数据流",
                  style: Theme.of(context).textTheme.headline3,
                ));
              case ConnectionState.active:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "数据流活跃异常 ${snapshot.error}",
                    style: Theme.of(context).textTheme.headline3,
                  ));
                } else {
                  return Center(
                      child: Text(
                    "数据流活跃 ${snapshot.data}",
                    style: Theme.of(context).textTheme.headline3,
                  ));
                }
              case ConnectionState.done:
                return Center(
                    child: Text(
                  "数据流关闭",
                  style: Theme.of(context).textTheme.headline3,
                ));
              default:
                throw "ConnectionState没有别的状态";
            }
          },
        ));
  }
}
