import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageViewBannerLoopPage extends StatefulWidget {
  PageViewBannerLoopPage({super.key});
  var total = 3;

  @override
  State<PageViewBannerLoopPage> createState() => _PageViewBannerLoopPageState();
}

/**
 *  PageView实现banner滚动
 */
class _PageViewBannerLoopPageState extends State<PageViewBannerLoopPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("banner"),
      ),
      body: Container(
        color: Colors.grey,
        width: size.width,
        height: 250,
        child: PageView.builder(
            // 监听pageView滑动事件
            onPageChanged: (value) {
              print("pageView滑动第$value");
              // 动态添加数据
              if (value > 5) {
                return;
              }

              if (value == widget.total - 1) {
                setState(() {
                  widget.total += 1;
                });
              }
            },
            scrollDirection: Axis.horizontal,
            itemCount: widget.total,
            itemBuilder: (context, index) {
              return Image.network(
                "https://www.itying.com/images/flutter/${index + 1}.png",
                fit: BoxFit.cover,
              );
            }),
      ),
    );
  }
}
