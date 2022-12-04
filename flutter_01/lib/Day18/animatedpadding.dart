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
 *  Flutter  AnimatedPadding动画
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
      body: AnimatedPadding(
        //动画类型
        curve: Curves.bounceOut,
        // 动画持续时间
        duration: Duration(seconds: 2),
        // 动画属性的改变
        padding: EdgeInsets.fromLTRB(flag ? 50 : 10, flag ? 50 : 10, 0, 0),
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
