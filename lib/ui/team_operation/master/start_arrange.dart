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
          title: const Text("開始排點"),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(),
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: [
                  OutlineContentArea(
                      title: "排點時間", content: "2021/10/10 10:10"),
                  const SizedBox(height: 24),
                  OutlineContentArea(
                      title: "排點時間", content: "2021/10/10 10:10"),
                  const SizedBox(height: 24),
                  OutlineContentArea(
                      title: "排點時間", content: "2021/10/10 10:10"),
                  const SizedBox(height: 24),
                  OutlineContentArea(
                      title: "排點時間", content: "2021/10/10 10:10"),
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
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RectOutlintContentArea(),
                        RectOutlintContentArea(),
                        RectOutlintContentArea(),
                        RectOutlintContentArea()
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

class RectOutlintContentArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.text_grey_E6, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text("2021/10/10 10:10",
                style: TextStyle(color: AppColor.black, fontSize: 14))));
  }
}
