import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Stack组件学习"),
      ),
      body: MyApp(),
    ),
  ));
}

/**
 * Stack 结合Positioned 使用，相对定位, Stack的子组件都是堆叠添加的
 * Stack相对于它的外部容器进行定位，例如外层的Container，如果外层没有容器，则相对于整个屏幕进行定位
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      color: Colors.green,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              color: Colors.red,
              width: 300,
              height: 300,
            ),
            left: 10,
            bottom: 10,
          ),
          Positioned(
              top: 20,
              left: 20,
              height: 100,
              width: 100,
              child: Image.asset(
                "images/localimage.png",
              )),
          Positioned(left: 20, top: 50, child: Text("您好我是个Text组件")),
        ],
      ),
    );
  }
}
