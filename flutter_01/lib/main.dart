import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import './Day23/pages/video.dart';
import './Day23/pages/chewie.dart';
import 'Day23/pages/imagepicker.dart';
import 'Day23/pages/cache.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

/**
 *  Flutter 插件
 */

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    //获取设备信息
    // final device = DeviceInfoPlugin();
    // final map = device.deviceInfo;
    // print(map);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 插件学习"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(builder: ((context) {
                        return VideoPage();
                      }))));
                },
                child: Text("VideoPlayer")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(builder: ((context) {
                        return ChewiePage();
                      }))));
                },
                child: Text("chewie")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(builder: ((context) {
                        return ImagePickerPage();
                      }))));
                },
                child: Text("imagePicker")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      (MaterialPageRoute(builder: ((context) {
                        return CachePage();
                      }))));
                },
                child: Text("本地存储"))
          ],
        ),
      ),
    );
  }
}
