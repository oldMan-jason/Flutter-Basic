import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioPage extends StatefulWidget {
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _DioPageState();
}

class _DioPageState extends State<DioPage> {
  @override
  void initState() {
    super.initState();

    _getMethod();
    _postMethod();
    _putMethod();
    _deleteMethod();
  }

  // 带参数的请求方式
  _getMethod() {
    Dio().get("https://jdmall.itying.com/api/httpGet",
        queryParameters: {"userid": 12}).then((value) {
      print(json.encode(value.data));
    });
    //带异常处理
    // Dio()
    //     .get("https://jdmall.itying.com/api/httpGet")
    //     .onError((error, stackTrace) {
    //   return Future.error(Exception("Get请求发生了异常"));
    // }).whenComplete(() {
    //   print("请求完成");
    // });
  }

  _postMethod() {
    Dio().post('https://jdmall.itying.com/api/httpPost',
        data: {"userName": 110}).then((value) {
      print(value.data);
    });
  }

  _putMethod() {
    Dio().put("https://jdmall.itying.com/api/httpPut",
        data: {"userName": "我是谁"}).then((value) {
      print(value.data);
    });
  }

  _deleteMethod() {
    Dio().delete("https://jdmall.itying.com/api/httpDelete",
        queryParameters: {"userName": "我是谁"}).then((value) {
      print(value.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio数据请求"),
      ),
      body: Container(),
    );
  }
}
