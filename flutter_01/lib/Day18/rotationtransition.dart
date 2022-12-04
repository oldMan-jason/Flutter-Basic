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
 *  Flutter  显示动画
 *  RotationTransition使用,通过AnimationController来控制动画的开始、暂停、继续等操作
 */
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    // 初始化AnimationController
    _controller = AnimationController(
      vsync: this, //程序和屏幕刷新的频率统一
      duration: Duration(seconds: 2),
      // value: 1,
      // lowerBound: 0.5,
      // upperBound: 1
    );
    //监听value
    _controller.addListener(() {
      // print("动画改变值${_controller.value}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 显示动画"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),

            // RotationTransition
            // RotationTransition(
            //   turns: _controller,
            //   child: FlutterLogo(
            //     size: 80,
            //   ),
            // ),

            // FadeTransition()
            FadeTransition(
              opacity: _controller,
              child: FlutterLogo(
                size: 80,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // 流水布局组件
            Wrap(
              runSpacing: 10,
              spacing: 10,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _controller.repeat();
                    },
                    child: Text("重复动画")),
                ElevatedButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    child: Text("顺时针旋转一次")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse();
                    },
                    child: Text("逆时针旋转一次")),
                ElevatedButton(
                    onPressed: () {
                      _controller.stop();
                    },
                    child: Text("停止")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reset();
                    },
                    child: Text("重置")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
