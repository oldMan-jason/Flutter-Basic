import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StackPage extends StatefulWidget {
  int totalCount = 1000;
  double height;
  List list;
  StackPage({super.key, this.height = 250, required this.list});

  @override
  State<StackPage> createState() => _StackPageState();
}

/**
 * banner自动轮播
 */
class _StackPageState extends State<StackPage> {
  late List<Widget> widgetList = [];
  late Timer timer;

  int scrollIndex = 0;
  late PageController pageController;

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    pageController.dispose();
    print("PageController销毁");
  }

  //组件生命周期函数
  @override
  void initState() {
    super.initState();
    _setupBannerData();

    // 初始化PageController
    pageController = PageController(initialPage: 0);

    //定时器
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      print("定时器在执行");
      pageController.animateToPage((scrollIndex + 1) % widgetList.length,
          duration: Duration(microseconds: 100), curve: Curves.bounceInOut);
    });
  }

  // banner数据
  _setupBannerData() {
    for (var i = 0; i < widget.list.length; i++) {
      var imageWidget = Image.network(
        widget.list[i],
        fit: BoxFit.cover,
      );
      widgetList.add(imageWidget);
    }
  }

  //指示器数据
  List<Widget> _getIndicatorData() {
    List<Widget> list = [];
    for (var i = 0; i < widgetList.length; i++) {
      var c = Container(
        margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
        width: 10,
        height: 10,
        alignment: Alignment.center,
        child: Text(
          "$i",
          style: TextStyle(
              color: scrollIndex == i ? Colors.white : Colors.black,
              fontSize: 8),
        ),
        decoration: BoxDecoration(
            // 根据滚动索引调整颜色
            color: scrollIndex == i ? Colors.blue : Colors.white,
            //设置圆形
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.1)),
      );
      list.add(c);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.grey,
          width: size.width,
          height: widget.height,
          child: PageView.builder(
              controller: pageController,
              // 监听pageView滑动事件
              onPageChanged: (value) {
                print("pageView滑动第$value");
                setState(() {
                  scrollIndex = value % widgetList.length;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: widget.totalCount,
              itemBuilder: (context, index) {
                // 无限滚动
                return widgetList[index % widgetList.length];
              }),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getIndicatorData(),
            ))
      ],
    );
  }
}
