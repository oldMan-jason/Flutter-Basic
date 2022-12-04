import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

/**
 *  Radio 单选按钮组
 *  GroupValue 是一组Radio共用的值，
 */
class _RadioPageState extends State<RadioPage> {
  int sex = 1;
  int pop = 2;
  //事件改变点击
  void onChange(value) {
    setState(() {
      sex = value;
    });
  }

  void onChange2(value) {
    setState(() {
      pop = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Text("男"),
                Radio(value: 1, groupValue: sex, onChanged: onChange),
                Text("女"),
                Radio(value: 2, groupValue: sex, onChanged: onChange)
              ],
            ),
            SizedBox(
              height: 20,
            ),

            // RadioListTile使用
            Text("是否健康宝弹窗:"),
            RadioListTile(
                title: Text("没有弹窗"),
                value: 1,
                groupValue: pop,
                onChanged: onChange2),
            RadioListTile(
                title: Text("已经弹窗"),
                value: 2,
                groupValue: pop,
                onChanged: onChange2),
          ],
        ),
      ),
    );
  }
}
