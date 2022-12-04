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

/** 显示动画
 *  Flutter 自定义AnimatedIcon 交错动画（ScaleTransition）
 *  从一个图标动画变化到另外一个动画图标，这个是系统自带的图标
 */
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
        child: Text("自定义交错动画"),
      ),
      appBar: AppBar(
        title: Text("AnimatedIcon 显示动画"),
      ),
      body: Center(
          child: Stack(
        children: [
          // 让search图标从0 - 0.3消失
          ScaleTransition(
            scale: _controller.drive(Tween(begin: 1, end: 0)
              ..animate(_controller)
              ..chain(CurveTween(curve: Curves.linear) //链式修改动画执行效果
                ..chain(CurveTween(curve: Interval(0.0, 0.3))))), //链式修改动画执行时间
            child: Icon(
              Icons.search,
              size: 70,
            ),
          ),

          // 让close从0.3-0.6出现
          ScaleTransition(
            scale: _controller.drive(Tween(begin: 0, end: 1)
              ..animate(_controller)
              ..chain(CurveTween(curve: Curves.linear) //链式修改动画执行效果
                ..chain(CurveTween(curve: Interval(0.3, 0.6))))), //链式修改动画执行时间
            child: Icon(
              Icons.close,
              size: 70,
            ),
          ),
        ],
      )),
    );
  }
}
