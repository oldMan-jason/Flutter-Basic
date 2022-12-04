import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageViewBannerPage extends StatefulWidget {
  PageViewBannerPage({super.key});
  var total = 1000;
  @override
  State<PageViewBannerPage> createState() => _PageViewBannerPageState();
}

/**
 *  PageView实现banner无限滚动
 *  添加指示器，动态改变索引值
 */
class _PageViewBannerPageState extends State<PageViewBannerPage> {
  late List<Widget> widgetList = [];

  int scrollIndex = 0;
  _getBannerData() {
    for (int i = 0; i < 3; i++) {
      Image image = Image.network(
        "https://www.itying.com/images/flutter/${i + 1}.png",
        fit: BoxFit.cover,
      );
      widgetList.add(image);
    }
  }

//指示器数据
  List<Widget> _getIndicatorData() {
    // List.generate(3, (index) => {

    // });

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
  void initState() {
    super.initState();
    _getBannerData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("banner"),
        ),
        // 堆叠组件使用
        body: Stack(
          children: [
            Container(
              color: Colors.grey,
              width: size.width,
              height: 250,
              child: PageView.builder(
                  // 监听pageView滑动事件
                  onPageChanged: (value) {
                    print("pageView滑动第$value");
                    setState(() {
                      scrollIndex = value % widgetList.length;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  // 总个数
                  itemCount: widget.total,
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
        ));
  }
}
