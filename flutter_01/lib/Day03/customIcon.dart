/**
 *  自定义图标类
 * 1、 https://www.iconfont.cn/ 阿里巴巴图标库
 * 2、 选择图标下载代码
 * 3、 vscode根目录新建font文件夹，导入下载的json和ttf
 * 4、 配置pubspec文件
 * 5、 自定义类加载图标 填写unicode值（16进制值），family名称（pubspec配置）
 */
import 'package:flutter/material.dart';

class CustomIcon {
  static const IconData book =
      IconData(0xf00a1, fontFamily: "CustomerFont", matchTextDirection: true);
  static const IconData cart =
      IconData(0xe899, fontFamily: "CustomerFont", matchTextDirection: true);
  static const IconData wechat =
      IconData(0xe8bb, fontFamily: "CustomerFont", matchTextDirection: true);

  static const IconData travel =
      IconData(0xffc9, fontFamily: "CustomerFont2", matchTextDirection: true);
  static const IconData rili =
      IconData(0xffca, fontFamily: "CustomerFont2", matchTextDirection: true);

  static const IconData arrow =
      IconData(0xe662, fontFamily: "CustomerFont3", matchTextDirection: true);
}
