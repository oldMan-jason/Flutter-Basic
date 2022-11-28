import 'package:flutter/material.dart';
import 'CustomContainer.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Row Column组件学习"),
      ),
      // body: MyApp(),
      // body: MyRow(),
      body: MyColumn(),
    ),
  ));
}

/**
 * Padding组件 设置组件之间的间距
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [
          CustomContainer(
            Icons.add,
            bgColor: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          CustomContainer(
            Icons.home,
            bgColor: Colors.blue,
          ),
          SizedBox(
            height: 10,
          ),
          CustomContainer(
            Icons.youtube_searched_for_outlined,
            bgColor: Colors.blue,
          )
        ],
      ),
    );
  }
}

/**
 * Row 组件 水平布局组件
 */
class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.grey,
      child: Row(
        // 设置主轴子元素的对齐模式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 相对于外部容器，在外部容器的位置
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomContainer(
            Icons.search,
            bgColor: Colors.yellow,
          ),
          CustomContainer(
            Icons.kayaking,
            bgColor: Colors.blue,
          ),
          CustomContainer(
            Icons.ad_units,
            bgColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

/**
 *  Column 垂直布局组件
 */
class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // 垂直方向主轴的对齐方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 相对父容器的布局对齐方式
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            Icons.search,
            bgColor: Colors.yellow,
          ),
          CustomContainer(
            Icons.kayaking,
            bgColor: Colors.blue,
          ),
          CustomContainer(
            Icons.ad_units,
            bgColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
