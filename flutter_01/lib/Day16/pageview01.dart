import 'package:flutter/material.dart';

/**
 *  PageView的基本使用
 *  1、通过children
 *  2、 通过pageView.builder
 */
// ignore: must_be_immutable
class PageViewPage extends StatefulWidget {
  int pageCount;
  PageViewPage(this.pageCount, {super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

Widget _getPageView(BuildContext context) {
  return PageView(
    children: [
      Text(
        "pageview",
        style: Theme.of(context).textTheme.headline3,
      ),
      Text(
        "pageview",
        style: Theme.of(context).textTheme.headline3,
      ),
      Text(
        "pageview",
        style: Theme.of(context).textTheme.headline3,
      ),
    ],
  );
}

class _PageViewPageState extends State<PageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView演示"),
      ),

      // body: _getPageView(context),

      // pageViewbuilder实现
      body: PageView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              child: Text("这个是第(${index + 1})"),
            );
          }),
    );
  }
}
