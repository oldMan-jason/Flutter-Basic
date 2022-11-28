import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  //文字内容
  String text;
  //点击事件
  var onPressAction = () {};

  CustomButton(this.text, this.onPressAction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          // 阴影颜色
          shadowColor: MaterialStateProperty.all(Colors.amber),
          // 圆角
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          // 背景颜色
          backgroundColor: MaterialStateProperty.all(Colors.orange),
          // 字体颜色
          foregroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: this.onPressAction,
      child: Text(text),
    );
  }
}
