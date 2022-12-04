import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  final Map<String, String> arguments;
  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

/**
 *  Hero动画 push图片时候，飞入飞出的效果
 */
class _HeroPageState extends State<HeroPage> {
  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    // 添加点击蒙层消失
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Hero(
              tag: widget.arguments,
              child: Image.network(
                widget.arguments["imageUrl"]!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
