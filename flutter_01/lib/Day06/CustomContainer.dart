import 'package:flutter/material.dart';

/**
 * 自定义带图标的Container组件
 */
// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  Color bgColor;
  IconData icon;
  // 自定义构造函数
  CustomContainer(this.icon, {this.bgColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: this.bgColor,
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: 24,
      ),
    );
  }
}
