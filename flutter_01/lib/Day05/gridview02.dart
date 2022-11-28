import 'package:flutter/material.dart';
import 'package:flutter_01/Day05/res/listData.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("GridView组件"),
      ),
      body: MyGridView(), //count
      // body: MyGridView02(),//extent
    ),
  ));
}

/**
 * GridView 网格布局
 * GridView.count构建
 */
// ignore: must_be_immutable
class MyGridView extends StatelessWidget {
  List<Widget> list = <Widget>[];

  MyGridView({super.key}) {
    this._getGridViewData();
  }

  void _getGridViewData() {
    var list = <Widget>[];
    for (int i = 0; i < listData.length; i++) {
      Map map = listData[i];
      var title = map["title"];
      var picUrl = map["imageUrl"];

      var container = Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.red,
              width: 4,
            )),
        child: Column(
          children: [
            SizedBox(
              height: 130,
              child: Image.network(
                picUrl,
                fit: BoxFit.cover,
              ),
            ),
            Text(title),
          ],
        ),
      );
      list.add(container);
    }
    this.list = list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // 设置一行最多显示几个
      crossAxisCount: 2,
      // 列间距
      crossAxisSpacing: 12,
      // 行间距
      mainAxisSpacing: 12,
      // 内边距
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      // 宽高比
      childAspectRatio: 1.2,
      // 数据源获取组件集合
      children: this.list,
    );
  }
}

/**
 * GridView通过extent构建
 */
class MyGridView02 extends StatelessWidget {
  const MyGridView02({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      // 设置子元素的最大长度
      maxCrossAxisExtent: 80,
      children: [
        Icon(Icons.precision_manufacturing),
        Icon(Icons.e_mobiledata),
        Icon(Icons.dangerous),
        Icon(Icons.cabin),
        Icon(Icons.add),
        Icon(Icons.home),
        Icon(Icons.face),
        Icon(Icons.g_mobiledata),
        Icon(Icons.h_mobiledata),
      ],
    );
  }
}
