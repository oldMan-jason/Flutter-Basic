import 'package:flutter/material.dart';
import './boxbutton.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

/**
 *  通过GlobalKey，从父widget中获取子widget的相关属性或者方法
 */

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey _globalKey1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Key"),
      ),
      body: Center(
        child: MyBoxButton(
          color: Colors.red,
          key: _globalKey1,
          val: 1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 1、通过GlobalKey 获取子widget的属性或者方法
          var boxButton = _globalKey1.currentWidget as MyBoxButton;
          print(boxButton.val);
          boxButton.testMethod();

          /**
           *  2、子组件状态
           */
          // 通过GlobalKey 获取子组件的state组件.这种方式只能是组件在同一个类文件中
          // var state = _globalKey1.currentState as _MyBoxButtonState;
          //如果组件是单独抽离的，因为组件的state是私有的，只能在内部通过key来过去state,间接处理
          boxButton.getStateInfo();

          /**
           *  3、渲染属性
           */
          RenderBox renderBox =
              _globalKey1.currentContext!.findRenderObject() as RenderBox;
          print(renderBox.size);
        },
        child: Icon(Icons.info),
      ),
    );
  }
}
