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
 * FutureBuilder 是一个组件，可以监听Future函数的执行状态
 */
class _MyAppState extends State<MyApp> {
  // 定义异步函数
  Future<String> _asyncMethod() async {
    await Future.delayed(Duration(seconds: 3));
    // throw "发生了异常"; //异常情况模拟代码
    return "这个是服务器数据";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder异步函数监听"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: _asyncMethod(), //监听的future函数
                initialData: "", //可以设置缓存的数据，不需要监听状态
                builder: ((context, snapshot) {
                  // 根据状态返回不同的组件
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text("Error:${snapshot.error}");
                    }
                  }
                  return Text("响应数据: ${snapshot.data}");
                })),
          ],
        ),
      ),
    );
  }
}
