import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachePage extends StatefulWidget {
  const CachePage({super.key});

  @override
  State<CachePage> createState() => _CachePageState();
}

// 存储管理对象
final Future<SharedPreferences> preference = SharedPreferences.getInstance();

class _CachePageState extends State<CachePage> {
  _saveData() async {
    SharedPreferences pre = await preference;
    pre.setInt("age", 12);
    pre.setBool("rich", false);
    pre.setDouble("height", 171.0);
    pre.setString("name", "jason");
    pre.setStringList("list", ["老王", "李四", "赵六"]);
  }

  _getData() async {
    SharedPreferences pre = await preference;
    var age = pre.get('age');
    print(age);
  }

  _deleteData() async {
    SharedPreferences pre = await preference;
    pre.remove("age");
    print(pre.getInt("age"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本地存储"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: _saveData, child: Text("存储")),
            ElevatedButton(onPressed: _getData, child: Text("获取")),
            ElevatedButton(onPressed: _deleteData, child: Text("删除"))
          ],
        ),
      ),
    );
  }
}
