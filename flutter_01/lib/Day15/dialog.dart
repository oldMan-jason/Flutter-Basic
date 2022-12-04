import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
 *  Dialog 组件
 * 1、 弹出alert框
 * 2、 在外层获取dialog返回值,知道点击的是哪一个按钮事件
 */

class _MyAppState extends State<MyApp> {
  /**
   * AlertDialog
   * async 异步函数
   */
  void _altertDialog() async {
    // 获取返回值
    var result = await showDialog(
        //点击蒙层是否消失alert
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // 顶部图片
            icon: Image.asset("images/localimage.png"),
            // 标题
            title: Text("AlertDialog"),
            // 内容
            content: Text("这个是altert的内容部分"),
            actions: [
              TextButton(
                  onPressed: () {
                    print("取消点击");
                    //pop添加返回值
                    Navigator.of(context).pop("cancel click");
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    print("确定点击");
                    Navigator.of(context).pop("sure click");
                  },
                  child: Text("Sure"))
            ],
            //acions按钮的对齐方式
            actionsAlignment: MainAxisAlignment.center,
          );
        });

    print("dialog 返回值 $result");
  }

/**
 *  simpleDialog
 */
  void _simpleDialog() async {
    var result = await showDialog(
        //点击蒙层是否消失alert
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("simpleDialog选择"),
            children: [
              SimpleDialogOption(
                child: Text("汉语"),
                onPressed: () {
                  Navigator.pop(context, "汉语");
                },
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "英语");
                },
                child: Text("英语"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "法语");
                },
                child: Text("法语"),
              )
            ],
          );
        });

    print("simpleDialog返回值 -- $result");
  }

/**
 *  showModalBottomSheet
 */
  void _showModalBottom() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 240,
            child: ListView(
              children: [
                ListTile(
                  title: Text("分享"),
                  onTap: () {
                    print("分享");
                    Navigator.pop(context, "分享了");
                  },
                ),
                ListTile(
                  title: Text("发布"),
                  onTap: () {
                    print("发布");
                    Navigator.pop(context, "发布了");
                  },
                ),
                ListTile(
                  title: Text("收藏"),
                ),
                ListTile(
                  title: Text("下载"),
                ),
              ],
            ),
          );
        });

    print("showModalBottomSheet -- $result");
  }

/**
 *  Toast
 */
  void _flutterToast() async {
    var result = await Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dialog组件"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: _altertDialog, child: Text("AlertDialog")),
            ElevatedButton(
                onPressed: _simpleDialog, child: Text("simpleDialog")),
            ElevatedButton(
                onPressed: _showModalBottom,
                child: Text("showModalBottomSheet")),
            ElevatedButton(onPressed: _flutterToast, child: Text("插件Toast")),
          ],
        )));
  }
}
