import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  Flutter  AnimatedSwitcher动画
 *  场景： 网络请求加loading 请求成功展示图片，这个过程加一个动画
 *  场景：改变同一个组件的文字内容，但是需要设置key
 * 
 *  transitionBuilder 实现自定义动画效果
 */
class _MyAppState extends State<MyApp> {
  bool flag = false;
  void _startAnimation() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 动画"),
      ),
      // 加数据
      floatingActionButton: FloatingActionButton(
        onPressed: _startAnimation,
        child: Icon(Icons.animation),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.white,
          alignment: Alignment.center,

          // AnimatedSwitcher,当子元素改变的时候会触发
          child: AnimatedSwitcher(
            // 动画执行时长
            duration: Duration(seconds: 2),
            // 自定义动画效果
            transitionBuilder: ((child, animation) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            }),
            //子组件动画1
            // child: flag
            //     ? Image.network(
            //         "https://www.itying.com/images/flutter/5.png",
            //         fit: BoxFit.cover,
            //       )
            //     : CircularProgressIndicator(),

            // 子组件动画2
            // 设置key，表示不再是原来的组件，
            child: Text(key: UniqueKey(), flag ? "我要开始动画内容演示了" : "我是开始前动画内容"),
          ),
        ),
      ),
    );
  }
}
