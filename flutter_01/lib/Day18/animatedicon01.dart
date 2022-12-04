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
 *  显示动画
 *  Flutter  AnimatedIcon 交错动画图标
 *  从一个图标动画变化到另外一个动画图标，这个是系统自带的图标
 */
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.repeat();
          });
        },
        child: Text("AnimatedIcon"),
      ),
      appBar: AppBar(
        title: Text("AnimatedIcon 显示动画"),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          AnimatedIcon(
              size: 80,
              icon: AnimatedIcons.ellipsis_search,
              progress: _controller),
          SizedBox(
            height: 20,
          ),
          AnimatedIcon(
              size: 80, icon: AnimatedIcons.arrow_menu, progress: _controller),
          SizedBox(
            height: 20,
          ),
          AnimatedIcon(
              size: 80, icon: AnimatedIcons.menu_close, progress: _controller),
        ],
      )),
    );
  }
}
