import 'package:flutter/material.dart';
import './custombutton.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Wrap组件学习"),
      ),
      body: MyApp(),
    ),
  ));
}

/**
 *  Wrap 组件
 *  Row 和 Column 都是单列或者单行布局，Wrap实现流式布局
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Wrap(
            //所有元素布局方向
            direction: Axis.horizontal,
            //水平间距
            spacing: 10,
            //垂直间距
            runSpacing: 20,
            //所有子元素对齐方式
            alignment: WrapAlignment.start,
            children: [
              CustomButton("自定义1", (() {
                print("object");
              })),
              CustomButton("自定义2", (() {
                print("object");
              })),
              CustomButton("自定义3", (() {
                print("object");
              })),
              CustomButton("自定义4", (() {
                print("object");
              })),
              CustomButton("自定义5", (() {
                print("object");
              })),
              CustomButton("自定义6", (() {
                print("object");
              })),
            ]));
  }
}
