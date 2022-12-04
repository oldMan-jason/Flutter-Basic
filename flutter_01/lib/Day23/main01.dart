import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'pages/video.dart';
import 'pages/chewie.dart';
import 'pages/imagepicker.dart';

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
                child: Text("imagePicker"))
          ],
        ),
      ),
    );
  }
}
