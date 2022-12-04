import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBoxButton extends StatefulWidget {
  //测试变量
  int? val;
  // 测试方法
  testMethod() {
    print("我是MyBoxButton组件的测试方法");
  }

  //间接方法_MyBoxButtonState中的属性和方法
  getStateInfo() {
    var btnState = (this.key as GlobalKey).currentState as _MyBoxButtonState;
    btnState.printInfo();
  }

  Color color;
  // 定义Key,区分组件
  MyBoxButton({Key? key, required this.color, int val = 0}) : super(key: key);

  @override
  State<MyBoxButton> createState() => _MyBoxButtonState();
}

class _MyBoxButtonState extends State<MyBoxButton> {
  int val = 0;

  // 测试方法
  printInfo() {
    print("当前累加数=${val}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              val++;
              widget.val = val;
            });
          },
          style: ButtonStyle(
              // 设置button的背景颜色
              backgroundColor: MaterialStateProperty.all(widget.color),
              // 设置button的圆角
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          child: Text(
            "$val",
            style: Theme.of(context).textTheme.headline3,
          )),
    );
  }
}
