import 'package:flutter/material.dart';
import 'pageview01.dart';
import 'pageview02.dart';
import 'pageview03.dart';
import 'pageview04.dart';
import 'pageview05.dart';

var routes = {
  "/": (context) => MyApp(),
  "/pageView": (context, {arguments}) => PageViewPage(arguments),
  "/pageViewbanner": (context) => PageViewBannerLoopPage(),
  "/pageViewbanner02": (context) => PageViewBannerPage(),
  "/pageViewbanner03": (context) => PageViewBannerTimerPage(),
  "/pageViewbanner04": (context) => PageViewBannerCachePage(),
};
void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (RouteSettings settings) {
      final String? name = settings.name; //  /news 或者 /search
      final Function? pageContentBuilder =
          routes[name]; //  Function = (contxt) { return const NewsPage()}

      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        } else {
          final Route route = MaterialPageRoute(
              builder: (context) => pageContentBuilder(context));

          return route;
        }
      }
      return null;
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  PageView组件
 */

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PageView组件"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/pageView", arguments: 4);
                },
                child: Text("PageView")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/pageViewbanner");
                },
                child: Text("PageView实现banner滚动")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/pageViewbanner02");
                },
                child: Text("PageView实现banner无限滚动")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/pageViewbanner03");
                },
                child: Text("自动轮播banner")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/pageViewbanner04");
                },
                child: Text("缓存")),
          ],
        )));
  }
}
