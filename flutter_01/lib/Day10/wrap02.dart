import 'package:flutter/material.dart';
import './custombutton.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Wrap组件练习"),
      ),
      body: MyApp(),
    ),
  ));
}

/**
 *  练习热搜UI界面
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Text(
            "热搜",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(20),
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              CustomButton("女装", () {}),
              CustomButton("男装", () {}),
              CustomButton("手机照相", () {}),
              CustomButton("美食火锅", () {}),
              CustomButton("轻奢用品", () {})
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Text(
            "历史记录",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Divider(),
        ListTile(
          title: Text("男装"),
        ),
        Divider(),
        ListTile(
          title: Text("笔记本"),
        ),
      ],
    );
  }
}
