/*
 I want to build a widget can show the image.

 If there is not image file or image url is provided, it will show the image icon with clickable,
 or it will show the image without clickable.
 */
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class ImageArea extends StatefulWidget {
  final bool enable;
  final String? imageUrl;
  final double? width;
  final double? height;
  final Function(File)? onImageSelected;

  ImageArea(
      {this.imageUrl,
      this.width,
      this.height,
      this.onImageSelected,
      this.enable = true});

  @override
  _ImageAreaState createState() => _ImageAreaState();
}

class _ImageAreaState extends State<ImageArea> {
  File? _imageFile; // 使用 State 來管理 imageFile 的狀態

  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.onImageSelected?.call(File(pickedFile.path));
      // 更新 imageFile 的狀態
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      widget.onImageSelected?.call(File(pickedFile.path));
      // 更新 imageFile 的狀態
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: widget.imageUrl != null || _imageFile != null
          ? InkWell(
              child: widget.imageUrl != null
                  ? Image.network(widget.imageUrl!, fit: BoxFit.cover)
                  : Image.file(_imageFile!, fit: BoxFit.cover),
            )
          : GestureDetector(
              onTap: () {
                if (!widget.enable) return;

                // Show options to pick image from gallery or camera
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.photo_library),
                            title: Text('從相簿選擇'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImageFromGallery();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.camera_alt),
                            title: Text('拍照'),
                            onTap: () {
                              Navigator.pop(context);
                              _pickImageFromCamera();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                  width: widget.width,
                  height: widget.height,
                  color: Colors.transparent,
                  child: Icon(Icons.photo, color: Colors.grey)
              ),
            ),
    );
  }
}
