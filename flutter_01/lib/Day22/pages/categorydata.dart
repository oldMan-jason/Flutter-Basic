import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CategoryDataPage extends StatefulWidget {
  const CategoryDataPage({super.key});

  @override
  State<CategoryDataPage> createState() => _CategoryDataPageState();
}

/**
 *  请求分类数据接口  通过FutureBuilder监听状态
 * 
    https://jdmall.itying.com/api/pcate
 */
class _CategoryDataPageState extends State<CategoryDataPage> {
  Future<List> _getCateoryData() async {
    var list = await Dio()
        .get("https://jdmall.itying.com/api/pcate")
        .then((value) => value.data["result"]);
    return list;
  }

  @override
  void initState() {
    super.initState();
    _getCateoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("获取分类数据"),
      ),
      body: FutureBuilder(
        future: _getCateoryData(),
        builder: (context, snapshot) {
          print('snapshot.data == ${snapshot.data}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error:${snapshot.error}");
            }

            if (snapshot.hasData) {
              List data = snapshot.data as List;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var title = data[index]["title"];
                    return ListTile(
                      title: Text(title),
                    );
                  });
            }
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
