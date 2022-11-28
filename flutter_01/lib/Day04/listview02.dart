import 'package:flutter/material.dart';
import 'package:flutter_01/Day03/customIcon.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("ListView组件-动态创建"),
      ),
      body: VerticalListView(),
    ),
  ));
}

/**
 * ListView组件 默认纵向滚动
 * 类似于ios的tableView
 * 一般结合ListTile使用，ListTile类似于UITableViewCell
 * 
 * 动态创建ListView的children
 */
class VerticalListView extends StatelessWidget {
  const VerticalListView({super.key});

  // ignore: unused_element
  List<Widget> _getListViewData() {
    var tmpList = <Widget>[];
    final titles = <String>["第一个", "第二个", "第三个", "第四个"];
    final picUrl = <String>[
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fbig5.wallcoo.com%2Fanimal%2Frabbit%2Fimages%2F%255Bwallcoo_com%255D_Lovely_rabbit_Picture_da033013s.jpg&refer=http%3A%2F%2Fbig5.wallcoo.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1671957621&t=85354893f4b0c024bd8a7fa86ac09838",
      "https://img2.baidu.com/it/u=1378116202,1216277235&fm=253&fmt=auto?w=800&h=1210",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2F2019-02-15%2F5c6661db428bb.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1671957684&t=1089ec213bee749b69d56f27c934dc1c",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2F2019-02-15%2F5c6652a14aef3.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1671957684&t=cabe9a6f0a4e67292b96b0565509da79"
    ];

    for (int i = 0; i < 4; i++) {
      ListTile tile = ListTile(
        leading: SizedBox(
          child: Image.network(
            picUrl[i],
            fit: BoxFit.cover,
          ),
          width: 100,
          height: 100,
        ),
        title: Text(titles[i]),
        trailing: Icon(
          CustomIcon.arrow,
          size: 24,
        ),
      );

      var container = Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        height: 100,
        child: tile,
      );
      tmpList.add(container);
    }
    return tmpList;
  }

  Widget build(BuildContext context) {
    return ListView(children: this._getListViewData());
  }
}
