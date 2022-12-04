import 'package:flutter/material.dart';
import './pages/categorydata.dart';
import './pages/dio.dart';
import './pages/jsonmap.dart';
import './pages/refresh.dart';
import './pages/html.dart';

var myRoutes = {
  "/categorydata": (context) => CategoryDataPage(),
  "/dio": (context) => DioPage(),
  "/jsonmap": (context) => JsonMapPage(),
  "/refresh": (context) => RefreshPage(),
  "/html": (context, {arguments}) => HtmlPage(aid: arguments),
};

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    onGenerateRoute: (RouteSettings settings) {
      final String? name = settings.name;
      final Function? pageContentBuilder = myRoutes[name];

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
 *  Flutter 远程请求 和页面刷新
 */

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api 请求"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/jsonmap");
                },
                child: Text(
                  "Json->Map演示",
                  style: Theme.of(context).textTheme.headline5,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/dio");
                },
                child: Text(
                  "Dio请求数据",
                  style: Theme.of(context).textTheme.headline5,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/categorydata");
                },
                child: Text(
                  "获取分类数据",
                  style: Theme.of(context).textTheme.headline5,
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/refresh");
                },
                child: Text(
                  "刷新",
                  style: Theme.of(context).textTheme.headline5,
                )),
          ],
        ),
      ),
    );
  }
}
