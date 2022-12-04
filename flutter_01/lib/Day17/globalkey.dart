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
 *  Flutter GlobalKey的使用
 *  通过屏幕旋转来实践GlobalKey
 */
class _MyAppState extends State<MyApp> {
  /**
   * 需要再组件初始化中使用
   */
  GlobalKey _globalKey1 = GlobalKey();
  GlobalKey _globalKey2 = GlobalKey();
  GlobalKey _globalKey3 = GlobalKey();

  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list = [
      /**GloablKey */
      MyBoxButton(key: _globalKey1, color: Colors.yellow),
      MyBoxButton(key: _globalKey2, color: Colors.purple),
      MyBoxButton(key: _globalKey3, color: Colors.orange)
    ];
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕旋转的防线
    var orientation = MediaQuery.of(context).orientation;

    return Stack(
      children: [
        Center(
          // 因为屏幕旋转，使用了不同的组件类型，不再保存状态，需要使用全局key标识
          child: orientation == Orientation.portrait
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list,
                )
              : Row(
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
