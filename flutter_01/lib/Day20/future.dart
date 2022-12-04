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
 * Flutter 异步线程
 */
class _MyAppState extends State<MyApp> {
  var stepNumber = 0;

// 迭代器事件
  void _updateStepCount() async {
    print("异步函数调用 -- 前");
    // 异步函数改同步函数，await必须同async配套使用
    await _asyncMethod();

    //异步执行函数
    asyncMethod2().then((value) {
      print(value);
    });

    //异步函数异常处理 catchError
    errorMethod().catchError((error) {
      print(error);
    }).whenComplete(() {
      print("完成");
    });
    //onError
    // errorMethod().onError((error, stackTrace) => {print(error)});

    print("异步函数调用 -- 后");

    setState(() {
      print("setState+前");
      stepNumber++;
      print("setState+后");
    });
    print("finised");
  }

  /**
   *  异步函数
   */

  _asyncMethod() {
    return Future(() {
      print("异步函数没有返回值");
    });
  }

  Future<String> asyncMethod1() {
    return Future(() {
      return Future.value("这个是固定的返回值");
    });
  }

  // 延迟返回数据
  Future<String> asyncMethod2() {
    return Future.delayed(Duration(seconds: 3), () {
      return "延迟返回的数据";
    });
  }

  // 自定义异步函数
  Future<String> asyncMethod3() {
    return Future(() {
      int result = 0;
      for (var i = 0; i < 10000; i++) {
        result += i;
      }
      return "result = $result";
    });
  }

  // 异步函数异常处理
  Future errorMethod() {
    return Future(() {
      Future.error(Exception("这个是一个异常的抛出"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _updateStepCount,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Flutter 同步异步"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$stepNumber",
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
