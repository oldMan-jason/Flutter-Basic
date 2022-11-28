import 'package:flutter/material.dart';
import 'package:flutter_01/Day05/res/listData.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("GridView组件"),
      ),
      // body: MyGridView(),
      body: MyGridView02(),
    ),
  ));
}

/**
 * GridView 通过builder动态创建
 * SliverGridDelegateWithFixedCrossAxisCount
 */
// ignore: must_be_immutable
class MyGridView extends StatelessWidget {
  MyGridView({super.key});

  // 方法抽离
  Widget _getItemBuilder(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange, width: 2)),
      child: Column(
        children: [
          Container(
            child: Image.network(
              listData[index]["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(listData[index]["title"])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 12.0, crossAxisSpacing: 12.0),
        itemBuilder: _getItemBuilder);
  }
}

/**
 * GridView 通过builder动态创建
 * SliverGridDelegateWithMaxCrossAxisExtent
 */
class MyGridView02 extends StatelessWidget {
  const MyGridView02({super.key});

// 方法抽离
  Widget _getItemBuilder(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange, width: 2)),
      child: Column(
        children: [
          Container(
            child: Image.network(
              listData[index]["imageUrl"],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(listData[index]["title"])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listData.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0),
        itemBuilder: _getItemBuilder);
  }
}
