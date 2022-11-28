import 'package:flutter/material.dart';
import 'package:flutter_01/Day03/customIcon.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("按钮组件学习"),
      ),
      body: Column(
        children: [MyButton()],
      ),
    ),
  ));
}

/**
 *  按钮组件 
 * 
 *  设置按钮的宽高，需要在button组件上嵌套一个 Container或者SizeBox组件
 */
class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: 40,
          child: Text("纯文字button"),
          alignment: Alignment.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                // 修改button的样式
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
                onPressed: () {
                  print("ElevatedButton click");
                },
                child: Text("ElevatedButton")),
            TextButton(
                onPressed: () {
                  print("TextButton click");
                },
                child: Text("TextButton")),
            OutlinedButton(
                onPressed: () {
                  print("OutlinedButton click");
                },
                child: Text("OutlinedButton"))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Text("图标+文字button"),
          alignment: Alignment.center,
          height: 30,
        ),
        // 带图标的button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
                onPressed: () {}, icon: Icon(Icons.add), label: Text("添加")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(CustomIcon.book),
                label: Text("书籍")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(CustomIcon.travel),
                label: Text("差旅"))
          ],
        ),

        Container(
          child: Text("自定义宽高button"),
          alignment: Alignment.center,
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
                // 修改button的样式
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
                onPressed: () {
                  print("ElevatedButton click");
                },
                child: Text("自定义宽高button")),
          ),
        ),
        Container(
          child: Text("配置button圆角"),
          alignment: Alignment.center,
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 140,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("圆角button"),
              //设置button的圆角
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
            ),
          ),
        ),
        Container(
          child: Text("圆形button"),
          alignment: Alignment.center,
          height: 30,
        ),
        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 60,
            height: 60,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("圆形button"),
              //设置圆形button
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      CircleBorder(side: BorderSide(color: Colors.white)))),
            ),
          ),
        ),
        Container(
          child: Text("FloatingActionButton"),
          alignment: Alignment.center,
          height: 30,
        ),
        // 在Scaffold参数中
        FloatingActionButton(
            child: Text("悬浮按钮"),
            onPressed: () {
              print("FloatingActionButton");
            })
      ],
    );
  }
}
