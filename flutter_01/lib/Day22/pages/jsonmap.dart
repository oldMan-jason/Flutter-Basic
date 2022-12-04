import 'dart:convert';

import 'package:flutter/material.dart';

class JsonMapPage extends StatefulWidget {
  const JsonMapPage({super.key});

  @override
  State<JsonMapPage> createState() => _JsonMapPageState();
}

/**
 * Json字符串和Map的转化
 */

class _JsonMapPageState extends State<JsonMapPage> {
  @override
  void initState() {
    super.initState();

    // Map 转 Json字符串
    var map = {'userName': 'jason', 'age': 12, 'sex': '男', 'ads': 'BJ'};
    var jsonStr = jsonEncode(map);
    print(jsonStr);
    var j = json.encode(map);
    print(j);

    // json字符串转Map
    Map map1 = json.decode(j);
    print(map1['userName']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json与Map转化"),
      ),
      body: Container(),
    );
  }
}
