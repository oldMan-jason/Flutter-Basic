import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewiePage extends StatefulWidget {
  const ChewiePage({super.key});

  @override
  State<ChewiePage> createState() => _ChewiePageState();
}

// 1 定义VideoPlayerController
final videoPlayerController = VideoPlayerController.network(
    'https://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');

class _ChewiePageState extends State<ChewiePage> {
  late ChewieController controller;

  @override
  void dispose() {
    videoPlayerController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 2 初始化ChewieController
    controller = ChewieController(
        autoPlay: true,
        looping: true,
        aspectRatio: 3 / 2, //宽高比
        videoPlayerController: videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chewie"),
      ),
      body: Center(
        // 3 返回chewie
        child: Chewie(controller: controller),
      ),
    );
  }
}
