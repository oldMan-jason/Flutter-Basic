import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

final ImagePicker _picker = ImagePicker();

class _ImagePickerPageState extends State<ImagePickerPage> {
// 拍照
  _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      print(photo.path);
    }
  }

  _pickPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image.path);
    }
  }

// 录制视频
  _takeVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
  }

//相册选择
  _selectPhotos() async {
    final List<XFile>? images = await _picker.pickMultiImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePicker"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          OutlinedButton(onPressed: _selectPhotos, child: Text("相册")),
          OutlinedButton(onPressed: _takePhoto, child: Text("拍照")),
          OutlinedButton(onPressed: _pickPhoto, child: Text("选照片")),
          OutlinedButton(onPressed: _takeVideo, child: Text("录制视频")),
        ],
      ),
    );
  }
}
