import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

/**
 *  1、TextField的常用属性
 *  2、TextField初始化赋值默认值
 */
class _TextFieldPageState extends State<TextFieldPage> {
  late final TextEditingController _textVC;
  @override
  void initState() {
    super.initState();
    // 给TextField默认初始值
    // _textVC = TextEditingController(text: "Jason");
    // _textVC = TextEditingController.fromValue(TextEditingValue(text: "Jason"));
    _textVC = TextEditingController.fromValue(TextEditingValue(
        text: "Jason",
        selection:
            TextSelection.fromPosition(TextPosition(offset: "Jason".length))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                //获取TextField的值
                onChanged: (text) {},
                // 密码输入样式
                obscureText: false,
                //修饰textfield
                decoration: InputDecoration(
                  // textfield添加图标
                  icon: Icon(Icons.lock),
                  // 占位提示
                  hintText: "请输入内容",
                  // 提示
                  helperText: "Textfield底部提示文案",
                  // 默认输入前缀
                  prefixText: "https://",
                  //前缀的图标
                  prefixIcon: Icon(Icons.security),
                  // 编辑状态下的删除
                  suffix: Text("suffix value"),
                  suffixIcon: Icon(Icons.delete),
                  // 边框样式设置
                  border: OutlineInputBorder(
                    // 设置圆角
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //绑定值
              TextField(
                controller: _textVC,
                decoration: InputDecoration(
                    hintText: "请输入用户名",
                    prefixIcon: Icon(Icons.people),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(style: BorderStyle.solid))),
              )
            ],
          )),
    );
  }
}
