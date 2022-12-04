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
 *  Flutter AnimatedContainer动画
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

      body: Center(
        child: AnimatedContainer(
          // 改变宽高
          width: flag ? 150 : 200,
          height: flag ? 150 : 200,
          //平移动画
          transform: Matrix4.translationValues(flag ? 100 : 0, 0, 0),
          color: Colors.yellow,
          // 必传参数：动画时长
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
