import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

/**
 * Container 组件
 */
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //包含的子组件
        child: const Text(
          "这是个Container组件学习",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28),
        ),

        //设置Container的Size
        width: 400,
        height: 60,

        //内部子组件对齐方式
        alignment: Alignment.center,

        // Container和子元素之间添加空白可以使用padding内边距，margin外边距
        padding: EdgeInsets.all(20),
        // padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.all(20),

        //Container背景颜色。不可以与BoxDecoration中的color同时使用
        // color: Colors.orange,

        //Decoration 装饰Container样式
        decoration: BoxDecoration(
            color: Colors.purple, //容器背景颜色
            borderRadius: BorderRadius.circular(30), //设置圆角
            //边框
            border: Border.all(
              color: Colors.yellow,
              width: 4,
            ),
            //阴影
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 5),
              BoxShadow(color: Colors.red, blurRadius: 10, spreadRadius: 5)
            ]),
      ),
    );
  }
}
