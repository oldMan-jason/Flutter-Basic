import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  Flutter  AnimatedOpacity动画
 */
class _MyAppState extends State<MyApp> {
  bool flag = false;
  void _startAnimation() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 动画"),
      ),
      // 加数据
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: Icon(Icons.animation),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("这个是第$index"),
                );
              }),
          // 隐式动画
          AnimatedPositioned(
              // 执行属性动画
              right: flag ? 240 : 40,
              top: flag ? 240 : 40,
              curve: Curves.linear,
              // 动画时长
              duration: Duration(seconds: 2),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
