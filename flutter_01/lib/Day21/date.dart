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
 *  Flutter 日期、时间、国际化
 */

class DateTimePage extends StatelessWidget {
  const DateTimePage({super.key});
  // 日期时间
  time() {
    // 获取当前时间
    var date = DateTime.now();
    print(date);
    print("年：${date.year} 月：${date.month} 日：${date.day}");
    print("时：${date.hour} 分：${date.second} 秒：${date.minute}");

    // 获取时间戳
    int time1 = date.millisecondsSinceEpoch; //13位
    print(time1);
    int time2 = date.microsecondsSinceEpoch; //16位
    print(time2);

    // 时间戳转化为时间
    var dateTime1 = DateTime.fromMillisecondsSinceEpoch(time1);
    print(dateTime1);
    var dateTime2 = DateTime.fromMicrosecondsSinceEpoch(time2);
    print(dateTime2);

    // 日期格式字符串转化成时间
    var timeString = "2023-12-10";
    var d = DateTime.parse(timeString);
    print(d);
    var timeString1 = "2023-12-10 18:23:20";
    var d1 = DateTime.parse(timeString1);
    print(d1);

    // Number类型的日期转时间
    var d3 = DateTime(2022, 12, 3);
    print(d3);

    // 日期的加减
    var d4 = d3.add(Duration(days: 5));
    print(d4);
    var d5 = d3.add(Duration(days: -5));
    print(d5);

    // 获取当前的时间
    var time = TimeOfDay.now();
    print(time);
  }

  @override
  Widget build(BuildContext context) {
    time();

    return Container();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期、时间、国际化"),
      ),
      body: DateTimePage(),
    );
  }
}
