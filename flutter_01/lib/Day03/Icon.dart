import 'package:flutter/material.dart';
import './customIcon.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Icon组件学习"),
      ),
      body: Center(
        child: Column(
          children: [
            //占位的空格
            SizedBox(
              height: 20,
            ),
            //系统自带图加载
            Icon(
              Icons.home,
              size: 64,
              color: Colors.red,
            ),
            SizedBox(
              height: 20,
            ),

            // 自定义图标
            Icon(
              CustomIcon.book,
              size: 44,
            ),
            Icon(
              CustomIcon.wechat,
              size: 44,
            ),
            Icon(
              CustomIcon.cart,
              size: 44,
            ),
            Icon(
              CustomIcon.travel,
              size: 44,
              // color: Colors.yellow,
            ),
            Icon(
              CustomIcon.rili,
              size: 44,
            ),
          ],
        ),
      ),
    ),
  ));
}
