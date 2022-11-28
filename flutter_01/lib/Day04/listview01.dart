import 'package:flutter/material.dart';
import 'package:flutter_01/Day03/customIcon.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("ListView组件"),
      ),
      // body: VerticalListView(),
      body: HorizontalListView(),
    ),
  ));
}

/**
 * ListView组件 默认纵向滚动
 * 类似于ios的tableView
 * 一般结合ListTile使用，ListTile类似于UITableViewCell
 */
class VerticalListView extends StatelessWidget {
  const VerticalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.home,
            size: 44,
          ),
          title: Text("首页"),
          subtitle: Text("这是副标题"),
          trailing: Icon(CustomIcon.arrow),
        ),
        Divider(), //横线
        ListTile(
          leading: Icon(Icons.share),
          title: Text("分享"),
          subtitle: Text("这是副标题"),
          trailing: Icon(CustomIcon.arrow),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            CustomIcon.wechat,
            size: 44,
          ),
          title: Text("微信"),
          subtitle: Text("开始微信的副标题"),
          trailing: Icon(CustomIcon.arrow),
        ),
        Divider(),
        Container(
          height: 40,
          child: Text(
            "这个是标题",
            style: TextStyle(fontSize: 24, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        Divider(),
        Image.network(
            "https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"),
      ],
    );
  }
}

/**
 * Dart 水平滚动
 */
class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 100,
      child: ListView(
        //设置滚动方向
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 100,
            color: Colors.yellow,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Image.network(
                    "https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
                    fit: BoxFit.cover,
                  ),
                ),
                Text("描述内容"),
              ],
            ),
          ),
          Container(
            width: 100,
            color: Colors.red,
          ),
          Container(
            width: 100,
            color: Colors.orange,
          ),
          Container(
            width: 100,
            color: Colors.blue,
          ),
          Container(
            width: 100,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
