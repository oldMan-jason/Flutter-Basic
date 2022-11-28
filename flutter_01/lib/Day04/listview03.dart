import 'package:flutter/material.dart';
import 'package:flutter_01/Day03/customIcon.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("ListView组件-动态创建"),
      ),
      body: VerticalListView(),
    ),
  ));
}

/**
 * ListView组件 默认纵向滚动
 * 类似于ios的tableView
 * 一般结合ListTile使用，ListTile类似于UITableViewCell
 * 
 * 动态创建ListView的children
 */
// ignore: must_be_immutable
class VerticalListView extends StatelessWidget {
  // 初始化数据
  List list = [];
  VerticalListView({super.key}) {
    for (int i = 0; i < 10; i++) {
      list.add(Text("这是第${i}条数据"));
    }
  }

/**
 * 通过ListView.builder 来动态获取数据
 * 必须设置的值: itemCount、itemBuilder
 */
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: this.list[index],
        );
      },
      itemCount: this.list.length,
    );
  }
}
