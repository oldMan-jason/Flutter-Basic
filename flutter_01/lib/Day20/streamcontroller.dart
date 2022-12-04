import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

/**
 * StreamController 自定义流和控制流
 * 数据流的过滤或者改变
 * 
 * where和 map
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 定义 StreamController
  // final _controller = StreamController();
// broadcast创建的流可以有多个监听者，使用方式相同
  final _controller = StreamController.broadcast();

  @override
  void initState() {
    super.initState();

    //监听流的值
    _controller.stream.listen((event) {});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StreamController")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //StreamBuilder
            StreamBuilder(
                //绑定数据流
                // stream: _controller.stream,

                // 数据流的过滤或者改变
                stream: _controller.stream
                    .where((event) => event % 2 == 0)
                    .map((event) => event / 10),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text("数据流已关闭");
                  }
                  if (snapshot.hasError) {
                    return Text("error： ${snapshot.error}");
                  }
                  if (snapshot.hasData) {
                    return Text("数据流: ${snapshot.data}");
                  }
                  return CircularProgressIndicator();
                }),

            Divider(),
            SizedBox(
              height: 30,
            ),
            // 通过Controller改变数据流
            ElevatedButton(
                onPressed: () {
                  _controller.add("${Random().nextInt(100)}");
                },
                child: Text("插入数据")),
            ElevatedButton(
                onPressed: () {
                  _controller.close();
                },
                child: Text("关闭数据流")),
          ],
        ),
      ),
    );
  }
}
