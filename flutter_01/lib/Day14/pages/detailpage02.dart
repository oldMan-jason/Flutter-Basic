import 'package:flutter/material.dart';

/**
 * 重新定义构造函数，正向传值
 */
// ignore: must_be_immutable
class DetailPushPage extends StatefulWidget {
  //参数
  String Id;
  DetailPushPage({required this.Id, super.key});

  @override
  State<DetailPushPage> createState() => _DetailPushPage();
}

/**
 * widget. 语法可以获取到定义的变量值
 */
class _DetailPushPage extends State<DetailPushPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("带参数push"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.Id),
            ElevatedButton(
                onPressed: () {
                  // 路由返回
                  Navigator.pop(context);
                  // Navigator.of(context).pop();
                },
                child: Text("POP返回"))
          ],
        ),
      ),
    );
  }
}
