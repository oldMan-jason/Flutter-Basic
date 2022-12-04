import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedNumberPage extends StatefulWidget {
  final StreamController controller;
  const AnimatedNumberPage({super.key, required this.controller});

  @override
  State<AnimatedNumberPage> createState() => _AnimatedNumberPageState();
}

/**
 * 1.定义显示的数字，算术生成
 * 2.定义数字的动画
 */
class _AnimatedNumberPageState extends State<AnimatedNumberPage>
    with SingleTickerProviderStateMixin {
  // 算术
  late int a, b;
  //标签随机色
  late Color color;
  late double left;
  // 定义动画
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _resetAnimated();

    // 添加stream流的监听
    widget.controller.stream.listen((event) {
      print("在动画组件中监听到的keyBoardValue == ${event}");
      if (event == a + b) {
        _resetAnimated();
        _animationController.forward(from: 0.0);
      }
    });

    // 初始化动画管理类并开始动画
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..forward();

    // 监听执行动画状态
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _resetAnimated();
        _animationController.forward(from: 0.0);
      }
    });
  }

  void _resetAnimated() {
    // 算术值
    a = Random().nextInt(5) + 1; //生成 0 - 5之间的数
    b = Random().nextInt(5); //生成0-4之间的数
    left = Random().nextDouble() * 300;

    // 随机标签颜色
    int colorCount = Colors.primaries.length;
    color = Colors.primaries[Random().nextInt(colorCount)];
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder 自定义动画
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        // 添加动画
        return Positioned(
          // 指定动画的范围
          top: Tween(begin: -40.0, end: 500.0)
              .animate(_animationController)
              .value,
          // left随机
          left: left,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: color.withAlpha(166),
                border: Border.all(color: Colors.yellow, width: 2.0)),
            child: Text(
              "$a+$b=?",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        );
      },
    );
  }
}
