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
 *  ScaleTransition使用,通过AnimationController来控制动画的开始、暂停、继续等操作
 *  AnimationController结合tween使用
 */
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    // 初始化AnimationController
    _controller = AnimationController(
      vsync: this, //程序和屏幕刷新的频率统一
      duration: Duration(seconds: 1),
      value: 1, //默认值
    );

    //监听value
    // _controller.addListener(() {
    // print("动画改变值${_controller.value}");
    // });
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
            // ScaleTransition(
            //   scale: _controller,
            //   child: Image.asset(
            //     "images/localimage.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),

            //_controller 结合Tween组件使用使用
            ScaleTransition(
              //begin和end系数，相对于child的宽高来计算的
              scale: _controller.drive(Tween(begin: 1, end: 2)),
              child: Container(
                width: 100,
                height: 100,
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
                      _controller.forward();
                    },
                    child: Text("forward")),
                ElevatedButton(
                    onPressed: () {
                      _controller.reverse();
                    },
                    child: Text("reverse")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
