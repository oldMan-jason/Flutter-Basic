import 'dart:ffi';

import 'package:flutter/material.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

/**
 *  多选样式
 */
class _CheckBoxPageState extends State<CheckBoxPage> {
  bool? flag = false;
  bool? checkBox1 = false;
  bool? checkBox2 = false;
  bool? checkBox3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
      ),
      body: Column(
        children: [
          Checkbox(
              value: flag,
              onChanged: (val) {
                setState(() {
                  flag = val;
                });
              }),
          Text(flag! ? "已选择" : "未选择"),
          SizedBox(
            height: 20,
          ),
          Text("你是否爱好以下运动"),
          CheckboxListTile(
              title: Text("篮球"),
              value: checkBox1,
              onChanged: (val) {
                setState(() {
                  checkBox1 = val;
                });
              }),
          CheckboxListTile(
              title: Text("足球"),
              value: checkBox2,
              onChanged: (val) {
                setState(() {
                  checkBox2 = val;
                });
              }),
          CheckboxListTile(
              title: Text("羽毛球"),
              value: checkBox3,
              onChanged: (val) {
                setState(() {
                  checkBox3 = val;
                });
              })
        ],
      ),
    );
  }
}
