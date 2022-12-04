import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PageViewBannerCachePage extends StatefulWidget {
  PageViewBannerCachePage({super.key});
  @override
  State<PageViewBannerCachePage> createState() =>
      _PageViewBannerCachePageState();
}

/**
 *  PageView缓存
 */
class _PageViewBannerCachePageState extends State<PageViewBannerCachePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("banner缓存的使用"),
        ),
        // 缓存
        body: PageView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return MyContainer(index: index);
            }));
  }
}

/**
 *  自定义组件,通过 AutomaticKeepAliveClientMixin实现单个组件的缓存
 */
class MyContainer extends StatefulWidget {
  final index;
  const MyContainer({super.key, required this.index});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("滚动index -- ${widget.index}");

    return Center(
      child: Text(
        "第${widget.index}屏",
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  @override
  //是否缓存当前widget
  bool get wantKeepAlive => true;
}
