import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("GridView组件"),
      ),
      // body: MyGridView(),
      body: MyGridView02(),
    ),
  ));
}

/**
 * GridView 网格布局
 * GridView.count构建
 */
class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 设置一行最多显示几个
      crossAxisCount: 4,
      children: [
        Icon(Icons.precision_manufacturing),
        Icon(Icons.e_mobiledata),
        Icon(Icons.dangerous),
        Icon(Icons.cabin),
        Icon(Icons.add),
        Icon(Icons.home)
      ],
    );
  }
}

/**
 * GridView通过extend构建
 */
class MyGridView02 extends StatelessWidget {
  const MyGridView02({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // 设置子元素的最大长度
      maxCrossAxisExtent: 80,
      children: [
        Icon(Icons.precision_manufacturing),
        Icon(Icons.e_mobiledata),
        Icon(Icons.dangerous),
        Icon(Icons.cabin),
        Icon(Icons.add),
        Icon(Icons.home),
        Icon(Icons.face),
        Icon(Icons.g_mobiledata),
        Icon(Icons.h_mobiledata),
      ],
    );
  }
}
