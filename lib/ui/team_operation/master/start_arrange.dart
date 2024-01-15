import 'package:flutter/material.dart';

import '../../../app_color.dart';

class StartArrangePage extends StatefulWidget {
  const StartArrangePage({super.key});

  @override
  _StartArrangeState createState() => _StartArrangeState();
}

class _StartArrangeState extends State<StartArrangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title at center with left arrow to and bottom line with grey color
          title: const Text("開始排隊"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: [
                  OutlineContentArea(title: "即時動態", content: "查看每個場地的動態"),
                  const SizedBox(height: 24),
                  OutlineContentArea(
                      title: "球隊管理",
                      content: "刪除隊員或新增隊員 (QR or 手動) 修改球友資訊 (場數、強度)"),
                  const SizedBox(height: 24),
                  OutlineContentArea(title: "場地資訓", content: "修改場地數，是否已收費"),
                  const SizedBox(height: 24),
                  OutlineContentArea(title: "比賽結束", content: "結束已計算花費點數"),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Text("當前排隊人數",
                          style: TextStyle(
                              color: AppColor.title_green, fontSize: 14)),
                      Expanded(child: SizedBox()),
                      Text("543 人",
                          style: TextStyle(
                              color: AppColor.title_green, fontSize: 20)),
                    ],
                  ),
                  const Divider(),
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RectOutlineContentArea(
                            title: "即時動態",
                            color: AppColor.title_green,
                            onTap: () {}),
                        RectOutlineContentArea(
                            title: "球隊管理", color: AppColor.blue, onTap: () {}),
                        RectOutlineContentArea(
                            title: "場地資訊",
                            color: AppColor.orange,
                            onTap: () {}),
                        RectOutlineContentArea(
                            title: "比賽結束",
                            color: AppColor.tag_red,
                            onTap: () {})
                      ])
                ]))
          ],
        )));
  }
}

class OutlineContentArea extends StatelessWidget {
  String title;
  String content;

  OutlineContentArea({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.text_grey_E6, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: AppColor.title_green, fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(content,
                    style: const TextStyle(color: AppColor.black, fontSize: 14))
              ],
            )));
  }
}

class RectOutlineContentArea extends StatelessWidget {
  String title;
  Color color;
  void Function()? onTap;

  RectOutlineContentArea(
      {super.key,
      required this.title,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: color, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(title,
                    style: TextStyle(color: color, fontSize: 20)))));
  }
}
