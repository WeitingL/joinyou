import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joinyou/NavigationHelper.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/ui/component/image_area.dart';
import 'package:joinyou/ui/create_team_pages/set_team_location.dart';

import '../component/bottom_bar.dart';

class CreateNormalTeam extends StatefulWidget {
  const CreateNormalTeam({super.key});

  @override
  State<StatefulWidget> createState() => _CreateNormalTeam();
}

class _CreateNormalTeam extends State<CreateNormalTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("新增球隊照片"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      TitleImgArea(),
                      SizedBox(height: 20),
                      IconImgArea()
                    ])),
            const Spacer(),
            const Divider(),
            BottomBarNext(
                content: "下一步",
                action: () {
                  context.push(NavigationHelper.CREATE_TEAM_LOCATION_PAGE);
                })
          ],
        )));
  }
}

class TitleImgArea extends StatefulWidget {
  const TitleImgArea({super.key});

  @override
  State<StatefulWidget> createState() => _TitleImgArea();
}

class _TitleImgArea extends State<TitleImgArea> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("封面照片"),
        SizedBox(height: 10),
        ImageArea(
          imageUrl: null,
          width: MediaQuery.of(context).size.width,
          height: 200,
          onImageSelected: (file) {},
          enable: true,
        ),
        SizedBox(height: 10),
        Text("圖檔僅接受 PNG 和 JPG 且檔案大小不可超過 5 MB")
      ],
    );
  }
}

class IconImgArea extends StatefulWidget {
  const IconImgArea({super.key});

  @override
  State<StatefulWidget> createState() => _IconImgArea();
}

class _IconImgArea extends State<IconImgArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("封面照片"),
        SizedBox(height: 10),
        ImageArea(
          imageUrl: null,
          width: 120,
          height: 120,
          onImageSelected: (file) {},
          enable: true,
        ),
        SizedBox(height: 10),
        Text("圖檔僅接受 PNG 和 JPG 且檔案大小不可超過 5 MB")
      ],
    );
  }
}

class ImageEditArea extends StatefulWidget {
  File? imgFile;

  ImageEditArea({super.key, required this.imgFile});

  @override
  State<ImageEditArea> createState() => _ImageEditAreaState();
}

class _ImageEditAreaState extends State<ImageEditArea> {
  File? _imgFile;

  @override
  Widget build(BuildContext context) {
    if (_imgFile == null) {
      return GestureDetector(
          onTap: _pickImage,
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.text_grey_E6,
                borderRadius: BorderRadius.circular(10)),
          ));
    } else {
      return Image.file(_imgFile!);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _imgFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }
}
