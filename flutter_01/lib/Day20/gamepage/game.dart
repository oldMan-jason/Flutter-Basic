import 'dart:async';

import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'animated.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // 定义数据流VC,点击键盘给流添加数据
  late StreamController<int> _controller;

  @override
  void initState() {
    super.initState();
    // 初始化，
    _controller = StreamController.broadcast();
    // 添加数据流改变的监听
    _controller.stream.listen((event) {
      // print("流数据改变 -- ${event}");
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          // 数据动画显示区组件
          AnimatedNumberPage(
            controller: _controller,
          ),
          // 底部键盘
          KeyBoardPage(
            inputController: _controller,
          )
        ],
      ),
    );
  }
}
