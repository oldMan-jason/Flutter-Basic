import 'package:flutter/material.dart';
import './boxbutton.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text("Flutter Key"),
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  Flutter Key的使用
 *  1. 可以保存状态
 *  2. 可以排序
 */
class _MyAppState extends State<MyApp> {
  List<Widget> list = [
    /**3中局部key */
    MyBoxButton(key: ValueKey("1"), color: Colors.yellow),
    MyBoxButton(key: UniqueKey(), color: Colors.purple),
    MyBoxButton(key: ObjectKey(Text("1")), color: Colors.orange)
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list,
          ),
        ),
        Positioned(
            right: 40,
            bottom: 100,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  // 数组随机排序
                  list.shuffle();
                });
              },
              child: Icon(Icons.refresh),
            ))
      ],
    );
  }
}
