import 'package:flutter/material.dart';

/**
 * Text组件学习
 */
class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      color: Colors.lightGreen,
      alignment: AlignmentDirectional.center,
      child: Text(
        "我是一个Text组件,我是一个Text组件,我是一个Text组件",
        // 字体样式
        style: TextStyle(
            color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        // 文字对齐方式
        textAlign: TextAlign.center,
        // 文本方向
        textDirection: TextDirection.ltr,
        // 是否换行
        softWrap: false,
        // 设置最大行数
        maxLines: 1,
        // 文字超出屏幕后处理方式
        overflow: TextOverflow.ellipsis,
        // 文字缩放系数
        textScaleFactor: 1.5,
      ),
    );
  }
}
