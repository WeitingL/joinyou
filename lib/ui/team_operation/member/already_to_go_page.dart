import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app_color.dart';
import '../master/start_arrange.dart';

class AlreadyToGo extends StatefulWidget {
  const AlreadyToGo({super.key});

  @override
  State<AlreadyToGo> createState() => _AlreadyToGoState();
}

class _AlreadyToGoState extends State<AlreadyToGo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title at center with left arrow to and bottom line with grey color
          title: const Text("已報到"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              OutlineContentArea(title: "開始按鈕", content: "開始配對對手與場地"),
              const SizedBox(height: 12),
              OutlineContentArea(title: "組隊按鈕", content: "可選擇您想要與誰組隊"),
              const SizedBox(height: 12),
              OutlineContentArea(title: "挑戰按鈕", content: "選擇您想要挑戰誰"),
              const SizedBox(height: 12),
              Divider(),
              const SizedBox(height: 12),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_E6, width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text("查看報名清單"),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_E6, width: 1),
                ),
                child: Row(
                  children: [
                    Text("隊內即時排名"),
                    Expanded(child: SizedBox()),
                    Text("排名20"),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.text_grey_E6, width: 1)),
                child: Row(
                  children: [
                    Text("離開當前隊伍"),
                    Expanded(child: SizedBox()),
                    Text("尚無隊伍"),
                    SizedBox(width: 12),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_E6, width: 1),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Text("啟用積分功能"),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Divider(),
              const SizedBox(height: 12),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    RectOutlineContentArea(
                        title: "開始", color: AppColor.title_green, onTap: () {}),
                    RectOutlineContentArea(
                        title: "組隊", color: AppColor.blue, onTap: () {}),
                    RectOutlineContentArea(
                        title: "挑戰", color: AppColor.orange, onTap: () {}),
                  ])
            ],
          ),
        ));
  }
}
