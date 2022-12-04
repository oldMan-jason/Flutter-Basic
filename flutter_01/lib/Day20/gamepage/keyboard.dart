import 'dart:async';

import 'package:flutter/material.dart';

class KeyBoardPage extends StatelessWidget {
  final StreamController inputController;
  final List<Widget> list = [];

  KeyBoardPage({super.key, required this.inputController});

  // 键盘UI数据搭建
  List<Widget> _getKeyBoardData(BuildContext context) {
    List.generate(9, (index) {
      var btn = ElevatedButton(
          onPressed: () {
            //流里面添加数据
            inputController.add(index + 1);
          },
          child: Text(
            "${index + 1}",
            style: Theme.of(context).textTheme.headline4,
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.primaries[index][400]),
              // 去除圆角
              shape: MaterialStateProperty.all(RoundedRectangleBorder())));
      list.add(btn);
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: GridView.count(
          childAspectRatio: 4 / 2,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: _getKeyBoardData(context),
        ));
  }
}
