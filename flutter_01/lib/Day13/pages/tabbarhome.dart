import 'package:flutter/material.dart';
import './movie.dart';
import './tuijian.dart';
import './video.dart';

class TabBarHomePage extends StatefulWidget {
  const TabBarHomePage({super.key});

  @override
  State<TabBarHomePage> createState() => _TabBarHomePageState();
}

/**
 *  1 with SingleTickerProviderStateMixin
 *  2 初始化  TabController
 *  3 使用TabBar组件作为title参数的值，可以解决导航标题嵌套的问题
 *  4 调整AppBar的高度，使用appBar的preferredSize
 *  5 调整TabBar的高度 嵌套Container
 */
class _TabBarHomePageState extends State<TabBarHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabVC;
  @override
  void initState() {
    super.initState();
    _tabVC = TabController(length: 4, vsync: this);

    // 通过监听的方式,既可以得到点击索引还可以得到滚动索引
    _tabVC.addListener(() {
      //当点击tab标签时会触发两次，需要判断
      if (_tabVC.animation!.value == _tabVC.index) {
        print("Listener index -- ${_tabVC.index}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 调整appBar的高度，使用PreferredSize
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44),
        child: AppBar(
            backgroundColor: Colors.red,
            // title: Text("嵌套的AppBar标题"),
            // 调整TabBar的高度
            title: Container(
              height: 36,
              child: TabBar(
                // 指定监听到点击的索引值
                onTap: (index) {
                  print("点击了--$index");
                },
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: "推荐",
                  ),
                  Tab(
                    text: "电影",
                  ),
                  Tab(
                    text: "视频",
                  ),
                  Tab(
                    text: "音乐",
                  ),
                ],
                // 绑定vc
                controller: _tabVC,
              ),
            )),
      ),
      body: TabBarView(
        children: [
          TuiJianPage(),
          MoviePage(),
          VideoPage(),
          Container(),
        ],
        // 绑定controller
        controller: _tabVC,
      ),
    );
  }
}
