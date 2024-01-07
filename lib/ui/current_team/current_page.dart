import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

import '../component/info_component.dart';

class CurrentTeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CurrentTeamPage();
}

class _CurrentTeamPage extends State<CurrentTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("即時球隊"),
        actions: [
          GestureDetector(
              child: const Text("編輯",
                  style: TextStyle(color: AppColor.title_green, fontSize: 20))),
          const SizedBox(width: 12)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(),
          const SizedBox(height: 30),
          Container(
            width: 250,
            height: 250,
            color: AppColor.text_grey_94,
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.ios_share,
                color: AppColor.title_green,
                size: 16,
              ),
              Text("分享排點資訊",
                  style: TextStyle(color: AppColor.title_green, fontSize: 16))
            ],
          ),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CardInformation(
                  titleLeft: "場地數",
                  titleMed: "打球時長",
                  titleRight: "團主加入",
                  contentLeft: "8",
                  contentMed: "2 小時",
                  contentRight: "是"))
        ],
      ),
    );
  }
}
