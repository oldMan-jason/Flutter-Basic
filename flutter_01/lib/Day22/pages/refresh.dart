import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

/**
 * 
 */
class _RefreshPageState extends State<RefreshPage> {
  List listData = [];
  // 监听滚动
  late ScrollController _controller;

  bool isrequest = true;
  bool hasData = true;

  int page = 1;
  _getPageData(bool pull) async {
    // 下拉再次刷新
    if (!pull) {
      hasData = true;
    }

    if ((!isrequest || !hasData)) {
      return;
    }

    pull ? page++ : page = 1;
    isrequest = false;
    var url =
        "https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${page}";
    print("请求页数 -- $page");
    List result = await Dio().get(url).then((value) {
      print(value.data);
      // 异步数据为json字符串
      Map map = json.decode(value.data);
      return map["result"];
    });

    hasData = result.isNotEmpty;
    print("page==${page} --  result == ${result}");

    setState(() {
      isrequest = true;
      listData.addAll(result);
    });
  }

  @override
  void initState() {
    super.initState();
    _getPageData(false);

    // 初始化，监听滚动事件
    _controller = ScrollController();
    _controller.addListener(() {
      //获取最大的屏幕高度
      var heigh = _controller.position.maxScrollExtent;
      // print("offset -- ${_controller.offset}");
      // print("pixels -- ${_controller.position.pixels}");
      if (_controller.offset > heigh - 30) {
        _getPageData(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("上拉/下拉刷新"),
      ),
      body: listData.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                  controller: _controller,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    Map dic = listData[index];

                    // 增加底部刷新按钮
                    if (index == listData.length - 1) {
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, "/html",
                                  arguments: dic["aid"]);
                            },
                            title: Text(dic["title"]),
                            subtitle: Text(
                              dic["username"],
                              softWrap: true,
                            ),
                          ),
                          hasData
                              ? CircularProgressIndicator()
                              : Center(
                                  child: Text("已经全部加载完毕"),
                                )
                        ],
                      );
                    } else {
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, "/html",
                              arguments: dic["aid"]);
                        },
                        title: Text(dic["title"]),
                        subtitle: Text(
                          dic["username"],
                          softWrap: true,
                        ),
                      );
                    }
                  }),
              onRefresh: () async {
                _getPageData(false);
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
