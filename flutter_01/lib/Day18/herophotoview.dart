import 'package:flutter/material.dart';
import 'package:flutter_01/Day05/res/listData.dart';
import 'package:flutter_01/Day18/pages/heropage.dart';
import 'pages/photoview.dart';

Map<String, Widget Function(BuildContext)> rou = {
  "/": (context) => MyGridView(),
  "/heropage": (context, {arguments}) => HeroPage(
        arguments: arguments,
      ),
  "/phtotpage": (context, {arguments}) => PhotoViewPage(
        arguments: arguments,
      ),
  "/mutilphtotpage": (context, {arguments}) =>
      MutilPhotoViewPage(arguments: arguments)
};

void main(List<String> args) {
  runApp(MaterialApp(
    initialRoute: "/",
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
 * Hero 动画
 * 只能实现路由切换的时候 飞入和 飞出的效果
 */
class MyGridView extends StatelessWidget {
  MyGridView({super.key});

  // 方法抽离
  Widget _getItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        // Hero系统自带动画
        // Navigator.of(context)
        //     .pushNamed("/heropage", arguments: listData[index]);

        // photo_view插件动画：单张图片浏览器
        // Navigator.of(context)
        //     .pushNamed("/phtotpage", arguments: listData[index]);

        // 多张图片预览
        // Navigator.of(context).pushNamed("/mutilphtotpage", arguments: listData,);

        //从默认点击的索引开始预览
        Navigator.of(context).pushNamed("/mutilphtotpage", arguments: {
          "listData": listData,
          "initPageNumber": index,
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange, width: 2)),
        child: Column(
          children: [
            Hero(
              tag: listData[index],
              child: Container(
                child: Image.network(
                  listData[index]["imageUrl"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(listData[index]["title"])
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: listData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0),
          itemBuilder: _getItemBuilder),
    );
  }
}
