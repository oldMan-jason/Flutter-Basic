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
 *  SlideTransition平移动画使用,通过AnimationController来控制动画
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
      duration: Duration(seconds: 2),
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
            // SlideTransition
            SlideTransition(
              //Tween的offset（x,y）,x和y相对于child的宽高来计算位移值
              //1.2 * 100 = 120
              position: _controller.drive(Tween(
                  begin: const Offset(0.0, 0),
                  end: const Offset(1.2, 1.2) //表示实际的位置向右移动自身宽度的1.2倍
                  )
                ..animate(_controller)
                ..chain(CurveTween(curve: Curves.bounceIn)) //动画执行效果
                ..chain(CurveTween(
                    curve: Interval(0.5, 0.8)))), //当前时间点的20%开始运动，运动到总时长的80%停止
              child: Container(
                color: Colors.red,
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
                      _controller.repeat();
                    },
                    child: Text("repeat")),
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
