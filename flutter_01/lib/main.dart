import 'package:flutter/material.dart';
import 'Day14/pages/detailpage02.dart';
import 'Day14/pages/detailpage01.dart';
import './Day14/pages/detailpage03.dart';

/**
 * 1. 配置路由
 */
Map<String, Widget Function(BuildContext)> rou = {
  "/": (context) => MyApp(),
  "/detail": (context) => DetailPage(),
};

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
// 配置onGenerateRoute
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
 *  Push的替换路由
 *  返回根路由
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
                  // 正常的push，一层一层的push
                  Navigator.pushNamed(context, "/detail");
                  //替换路由，1 - 2 -3 从3返回时到1，在页面2执行pushReplacementNamed函数，3替换2页面
                  Navigator.of(context).pushReplacementNamed("/detail");
                  //点击页面按钮返回到根组件视图
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Container(); //使用根组件替换Container
                  }), (route) => false);
                },
                child: Text("命名路由跳转")),
          ],
        )));
  }
}
