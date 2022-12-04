import 'dart:async';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

/**
 *  AnimatedList
 */
class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 * 1. 创建GlobalKey，约定类型为AnimatedListState
 * 2. 构建AnimatedList组件，设置key
 * 3. 创建动画
 * 
 */
class _MyAppState extends State<MyApp> {
  //key
  final GlobalKey<AnimatedListState> globalKey = GlobalKey<AnimatedListState>();

  // 初始化数据
  List list = ["这是第1条数据", "这是第2条数据", "这是第3条数据", "这是第4条数据"];

  //控制快速点击删除导致的问题
  bool canClick = true;

  // 增加数据
  void _addRow() {
    // insertItem(index), 插入的索引
    list.add("这个是第${list.length + 1}条数据");
    globalKey.currentState!.insertItem(list.length - 1);
  }

  // 抽离
  Widget _buildItem(context, index) {
    return ListTile(
        key: ValueKey(index),
        title: Text(list[index]),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _deleteRow(context, index),
        ));
  }

  // 删除数据
  void _deleteRow(context, index) {
    if (this.canClick) {
      this.canClick = false;

      //需要重新设置状态
      setState(() {
        globalKey.currentState!.removeItem(index, (context, animation) {
          //注意先build然后再去删除
          var item = _buildItem(context, index);
          list.removeAt(index);
          return FadeTransition(
            opacity: animation,
            child: item,
          );
        }, duration: Duration(milliseconds: 800));
      });

      Timer.periodic(Duration(milliseconds: 800), (timer) {
        if (!canClick) {
          canClick = true;
          timer.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedList"),
      ),
      // 加数据
      floatingActionButton: FloatingActionButton(
        onPressed: _addRow,
        child: Text("加一条"),
      ),

      body: AnimatedList(
        key: globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: _buildItem(context, index),
          );
        },
      ),
    );
  }
}
