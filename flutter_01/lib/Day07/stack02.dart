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
 * 实现一个 ListView添加二级导航标题，列表滚动悬浮顶端
 * 
 * 在Positioned内部包 row需要设置Positioned的size
 * Positioned中无法使用double.infinity（无限大值）
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //获取屏幕的size
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("这是一个列表${index}"),
            );
          },
          itemCount: 30,
        ),
        Positioned(
            width: size.width,
            height: 44,
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text(
                "我是一个标题",
                style: TextStyle(color: Colors.yellow, fontSize: 25),
              ),
            ))
      ],
    );
  }
}
