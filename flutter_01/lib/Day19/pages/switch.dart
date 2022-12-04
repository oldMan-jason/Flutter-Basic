import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

/**
 *  滑动开关组件
 */
class _SwitchPageState extends State<SwitchPage> {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(
        child: Switch(
            value: flag,
            onChanged: (value) {
              setState(() {
                flag = value;
              });
            }),
      ),
    );
  }
}
