import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

/**
 *  StatefulWidget有状态组件
 *  实现一个计数器，点击按钮让计数器加1
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("StatefulWidget有状态组件"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              number++;
            });
          },
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$number",
                style: Theme.of(context).textTheme.headline1,
              ),
              Text("点击按钮增加计数值"),
              SizedBox(
                height: 100,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    //改变值
                    setState(() {
                      number++;
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text("加数"))
            ],
          ),
        ));
  }
}
