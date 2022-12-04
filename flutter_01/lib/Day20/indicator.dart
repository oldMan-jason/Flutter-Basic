import 'package:flutter/cupertino.dart';
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

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            //圆形进度条
            CircularProgressIndicator(
              value: 0.3, //进度值
              backgroundColor: Colors.amber,
              color: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
            SizedBox(
              height: 30,
            ),
            //线性进度条
            LinearProgressIndicator(
              value: 0.5, //进度值
              backgroundColor: Colors.amber,
              color: Colors.green,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),

            SizedBox(
              height: 30,
            ),
            //iOS进度等待
            CupertinoActivityIndicator(),
          ],
        ),
      ),
    );
  }
}
