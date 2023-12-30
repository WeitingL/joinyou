import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

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
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.text_grey_E6, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InfoContent(title: "場地數", content: "8"),
                    Container(
                      width: 1, height: 20, color: AppColor.text_grey_E6,
                    ),
                    InfoContent(title: "打球時長", content: "2 小時"),
                    Container(
                      width: 1, height: 20, color: AppColor.text_grey_E6,
                    ),
                    InfoContent(title: "團主加入", content: "是")
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class InfoContent extends StatelessWidget {
  String title;
  String content;

  InfoContent({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(color: AppColor.title_green, fontWeight: FontWeight.w600)),
        Text(content, style: const TextStyle(color: AppColor.black))
      ],
    );
  }

}
