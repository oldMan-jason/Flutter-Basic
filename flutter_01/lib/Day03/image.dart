import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("图片组件学习")),
      body: Column(children: [
        MyPicWidget(),
        CircleImage(),
        ClipImage(),
        LocalImage(),
      ]),
    ),
  ));
}

/**
 * 图片组件学习
 * image.asset 加载本地图片
 * image.network 加载远程图片
 */
class MyPicWidget extends StatelessWidget {
  const MyPicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        width: 300,
        height: 150,
        child: Image.network(
          // 网络地址图片加载
          "https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
          // 适配模式
          fit: BoxFit.cover,
          // 重复模式
          // repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}

/**
 * 圆形图片
 */
class CircleImage extends StatelessWidget {
  const CircleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      width: 150,
      height: 150,
      // 设置圆心图片
      decoration: BoxDecoration(
          color: Colors.yellow,
          // 圆形图片
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.all(Radius.circular(75)),
          image: DecorationImage(
              image: NetworkImage(
                  "https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800"),
              fit: BoxFit.cover)),
    );
  }
}

/**
 *  通过ClipOval加载椭圆或者圆形
 */
class ClipImage extends StatelessWidget {
  const ClipImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      // 如果宽高相等我圆形图否则为椭圆形
      width: 150,
      height: 100,
      child: ClipOval(
        child: Image.network(
          "https://img2.baidu.com/it/u=1003272215,1878948666&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/**
 *  加载本地图片
 * 1、新建images文件夹，包含2.0x 和 3.0x
 * 2、pubspec.ymal文件，配置assets
 * 3、设置路片路径
 */
class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      child: Image.asset(
        "images/localimage.png",
        fit: BoxFit.none,
      ),
    );
  }
}
