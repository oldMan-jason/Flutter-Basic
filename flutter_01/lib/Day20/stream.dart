import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 * Stream
 */
class _MyAppState extends State<MyApp> {
  // 定一个Future的3种方式
  Future<int> loadFutureData() {
    // return Future.value(123);

    // return Future.delayed(Duration(seconds: 2), () {
    //   return 12;
    // });
    return Future(() {
      return 12;
    });
  }

  // 定义一个异步的流
  Stream<int> loadStreamData() {
    return Stream.periodic(Duration(seconds: 3), (val) {
      return val + 1;
    });
  }

  @override
  void initState() {
    //Future的调用
    loadFutureData().then((val) {
      print(val);
    });

    //调用异步流函数
    loadStreamData().listen((event) {
      print(event);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
