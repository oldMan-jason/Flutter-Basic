import 'package:flutter/material.dart';
import './pages/movie.dart';
import './pages/tuijian.dart';
import './pages/video.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

/**
 * TabBar结合TabBarView实现头条滚动的底部导航按钮功能
 * 1、 混入SingleTickerProviderStateMixin
 * 2、 定义TabController
 * 3、 配置TabBar和TabBarView，
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabVC;

  // 生命周期函数
  @override
  void initState() {
    super.initState();
    _tabVC = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // 导航条背景颜色
          backgroundColor: Colors.green,
          //导航左边按钮
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          //右侧多个按钮
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more))
          ],
          // 导航标题
          title: Text("TabBar组件"),
          // 导航标题居中展示
          centerTitle: true,
          // 导航底部按钮
          bottom: TabBar(
            // 标题多了是否可以滚动
            isScrollable: true,
            // 必须设置controller
            controller: _tabVC,
            // 底部指示器横线颜色
            indicatorColor: Colors.white,
            // 点击时水波纹的颜色
            // overlayColor: MaterialStateProperty.all(Colors.purple),
            //底部指示器的宽度跟label等宽
            // indicatorSize: TabBarIndicatorSize.label,

            // 指示器的间距
            indicatorPadding: EdgeInsets.all(5),
            indicatorWeight: 2,
            // 修饰指示器选中的背景颜色和圆角
            indicator: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(4)),
            // 标签文字颜色
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "推荐",
              ),
              Tab(
                text: "视频",
              ),
              Tab(
                text: "电影",
              ),
              Tab(
                text: "汽车",
              ),
              Tab(
                text: "音乐",
              ),
              Tab(
                text: "美食",
              ),
              Tab(
                text: "汽车",
              ),
              Tab(
                text: "科技",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TuiJianPage(),
            VideoPage(),
            MoviePage(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
          // 必须设置controller
          controller: _tabVC,
        ));
  }
}
