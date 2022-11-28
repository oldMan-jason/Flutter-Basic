import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("页面布局组件学习"),
      ),
      body: Column(
        children: [
          MyApp(),
          SizedBox(
            height: 10,
          ),
          MyCard()
        ],
      ),
    ),
  ));
}

/**
 * 页面布局组件 AspectRatio 
 * 控制子元素的宽高比
 * 
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 3 / 1,
      child: Container(
        width: size.width,
        color: Colors.red,
      ),
    );
  }
}

/**
 * Card 组件
 * 
 * CircleAvatar实现圆形头像
 */

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // waringing
      /**解决ListView嵌套问题，根据子组件撑起高度 */
      shrinkWrap: true,
      children: [
        Card(
          // 阴影的深度
          elevation: 5,
          //设置阴影颜色
          shadowColor: Colors.red,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          // 阴影的卡片的弧度
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                // 圆形头像
                leading: CircleAvatar(
                  // radius: 20,设置弧度
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/3.png"),
                ),
                title: Text('老王'),
                subtitle: Text('一枚有态度的程序员'),
              ),
              Divider(),
              ListTile(
                title: Text("电话1222"),
              ),
              ListTile(
                title: Text("地址xxxxxx"),
              ),
            ],
          ),
        ),
        Card(
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                // 设置圆形头像
                leading: ClipOval(
                  child: Image.network(
                    "https://www.itying.com/images/flutter/3.png",
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
                title: Text('老孟'),
                subtitle: Text('一枚有态度的程序员'),
              ),
              Divider(),
              ListTile(
                title: Text("电话1222"),
              ),
              ListTile(
                title: Text("地址xxxxxx"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
