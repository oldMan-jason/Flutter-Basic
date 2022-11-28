import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPageByMap extends StatefulWidget {
  Map<String, String> parmaters;
  DetailPageByMap({required this.parmaters, super.key});

  @override
  State<DetailPageByMap> createState() => _DetailPageByMapState();
}

class _DetailPageByMapState extends State<DetailPageByMap> {
  @override
  void initState() {
    super.initState();
    print(widget.parmaters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: Container(
        child: Text("这个是详情"),
      ),
    );
  }
}
