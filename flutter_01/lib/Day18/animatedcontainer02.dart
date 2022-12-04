import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  Flutter AnimatedContainer实现抽屉动画
 */
class _MyAppState extends State<MyApp> {
  bool flag = false;
  void _startAnimation() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Flutter 动画"),
          ),
          // 加数据
          floatingActionButton: FloatingActionButton(
            onPressed: _startAnimation,
            child: Icon(Icons.animation),
          ),
          body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("这个是第$index"),
                );
              }),
        ),
        Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              padding: EdgeInsets.all(20),
              color: Colors.grey,
              width: 200,
              transform: Matrix4.translationValues(flag ? 0 : -200, 0, 0),
              duration: Duration(milliseconds: 500),
            ))
      ],
    );
  }
}
