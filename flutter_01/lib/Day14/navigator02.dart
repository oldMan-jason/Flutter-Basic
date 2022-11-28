import 'package:flutter/material.dart';
import 'pages/detailpage02.dart';
import 'pages/detailpage01.dart';
import './pages/detailpage03.dart';

/**
 * 1. 配置路由
 */
Map<String, Widget Function(BuildContext)> rou = {
  "/": (context) => MyApp(),
  "/detail": (context) => DetailPage(),
  "/detailbyparam": (context, {arguments}) => DetailPushPage(
        Id: arguments,
      ),
  // 命名参数写法
  "/detailbymap": (context, {arguments}) =>
      DetailPageByMap(parmaters: arguments)
};

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",

//2. 配置onGenerateRoute
    onGenerateRoute: (RouteSettings settings) {
      final String? name = settings.name; //  /news 或者 /search
      final Function? pageContentBuilder =
          rou[name]; //  Function = (contxt) { return const NewsPage()}

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

/**
 *  命名路由跳转和传值
 */

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("路由组件"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/detail");
                },
                child: Text("命名路由跳转")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/detailbyparam",
                      arguments: "122");
                },
                child: Text("命名路由跳转传值")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/detailbymap",
                      arguments: {"bookName": "元宇宙", "bookid": "1100"});
                },
                child: Text("命名路由跳转传值")),
          ],
        )));
  }
}
