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
 *  Flutter  AnimatedDefaultTextStyle动画
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
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            child: Text("这个是AnimatedDefaultTextStyle动画"),
            // 是否允许换行展示
            softWrap: true,
            overflow: TextOverflow.clip,
            style: TextStyle(
                // 设置TextStyle的属性动画
                fontSize: flag ? 28 : 18,
                color: flag ? Colors.purple : Colors.orange),
            duration: Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
