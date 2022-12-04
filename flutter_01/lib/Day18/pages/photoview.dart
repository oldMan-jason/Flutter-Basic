import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/**
 * 单张图片预览
 */
class PhotoViewPage extends StatefulWidget {
  final Map<String, String> arguments;
  const PhotoViewPage({super.key, required this.arguments});

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

/**
 *  PhotoView插件实现图片浏览器的功能
 */
class _PhotoViewPageState extends State<PhotoViewPage> {
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
            child: PhotoView(
                // 加载本地图片
                // imageProvider: AssetImage("images/localimage.png"),
                // 加载远程图片
                imageProvider: NetworkImage(widget.arguments["imageUrl"]!)),
          ),
        ),
      ),
    );
  }
}

/**
 *  多张图片预览
 */
class MutilPhotoViewPage extends StatefulWidget {
  final Map arguments;
  const MutilPhotoViewPage({
    required this.arguments,
    super.key,
  });

  @override
  State<MutilPhotoViewPage> createState() => _MutilPhotoViewPageState();
}

class _MutilPhotoViewPageState extends State<MutilPhotoViewPage> {
  late final List listData;
  late int initPageNumber;

  @override
  void initState() {
    super.initState();
    listData = widget.arguments["listData"];
    initPageNumber = widget.arguments["initPageNumber"];
  }

  @override
  Widget build(BuildContext context) {
    // 添加点击蒙层消失
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: Container(
              width: double.infinity,
              height: 400,
              // 多张图片预览
              child: PhotoViewGallery.builder(
                  onPageChanged: (index) {
                    print("多张图片预览 -- ${index}");
                    setState(() {
                      initPageNumber = index;
                    });
                  },
                  pageController: PageController(initialPage: initPageNumber),
                  itemCount: listData.length,
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                        imageProvider:
                            NetworkImage(listData[index]["imageUrl"]));
                  }),
            )),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 30,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "${initPageNumber + 1}/${listData.length}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    decoration: TextDecoration.none), //去掉下划线
              ),
            ),
          )
        ],
      ),
    );
  }
}
