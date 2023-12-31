import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';
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
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingTeamLocation()));
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
        Container(
            height: 120,
            decoration: BoxDecoration(
                color: AppColor.text_grey_E6,
                borderRadius: BorderRadius.circular(10))),
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
        Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                color: AppColor.text_grey_E6,
                borderRadius: BorderRadius.circular(10))),
        SizedBox(height: 10),
        Text("圖檔僅接受 PNG 和 JPG 且檔案大小不可超過 5 MB")
      ],
    );
  }
}
