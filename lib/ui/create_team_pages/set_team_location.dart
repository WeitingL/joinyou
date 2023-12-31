import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

import '../component/bottom_bar.dart';
import '../component/edit_components.dart';

class SettingTeamLocation extends StatefulWidget {
  const SettingTeamLocation({super.key});

  @override
  State<StatefulWidget> createState() => _SettingTeamLocation();
}

class _SettingTeamLocation extends State<SettingTeamLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("新增球隊位置"),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              height: 220,
              color: AppColor.text_grey_94,
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EditTextContentArea(title: "地址", hintTitle: "請選擇場地址"),
                    SizedBox(height: 20),
                    EditTextContentArea(title: "附近資訊(選填)", hintTitle: "請輸入附近資訊")
                  ],
                )),
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
