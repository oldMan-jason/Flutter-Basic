import 'package:flutter/material.dart';
import './pages/stackpage.dart';

// ignore: must_be_immutable
class PageViewBannerTimerPage extends StatefulWidget {
  PageViewBannerTimerPage({super.key});
  @override
  State<PageViewBannerTimerPage> createState() =>
      _PageViewBannerTimerPageState();
}

/**
 *  PageView添加定时器
 *  Stack组件的抽离
 */
class _PageViewBannerTimerPageState extends State<PageViewBannerTimerPage> {
  List<String> picUrl = [];
  @override
  void initState() {
    super.initState();
    _getBannerData();
  }

  _getBannerData() {
    for (int i = 0; i < 3; i++) {
      var pic = "https://www.itying.com/images/flutter/${i + 1}.png";
      picUrl.add(pic);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("banner自动播放"),
        ),
        // 堆叠组件使用
        body: StackPage(
          list: picUrl,
        ));
  }
}
