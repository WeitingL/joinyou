import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

import '../../component/button_component.dart';
import '../../component/title_switch_bar.dart';

class MemberManager extends StatefulWidget {
  @override
  _MemberManagerState createState() => _MemberManagerState();
}

class _MemberManagerState extends State<MemberManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("報名管理"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SwitcherBar(
                        options: ["未確認", "已確認"],
                        onPress: (index) {},
                        isLoading: false),
                    const MemberUncheckedItem()
                  ],
                )),
          ],
        ));
  }
}

class MemberUncheckedItem extends StatelessWidget {
  const MemberUncheckedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // user info
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("王大陸", style: TextStyle(fontSize: 20)),
                      SizedBox(width: 8),
                      Text("200 積分",
                          style: TextStyle(
                              color: AppColor.title_green, fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CustomTag(title: "無故未到"),
                      const SizedBox(width: 8),
                      CustomTag(title: "臨時取消"),
                    ],
                  ),
                ],
              ),

              const Expanded(child: SizedBox()),

              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlineButton(
                    content: "確認",
                    color: AppColor.title_green,
                  ),
                  SizedBox(height: 12),
                  OutlineButton(
                    content: "取消",
                    color: AppColor.tag_red,
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(height: 8),
          const Divider()
        ]);
  }
}

class CustomTag extends StatelessWidget {
  String title;

  CustomTag({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: setBackGroundColor(title),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
          child: Text(
            title,
            style: TextStyle(
                color: setTitleColor(title), fontWeight: FontWeight.w600),
          ),
        ));
  }

  Color setTitleColor(String title) {
    switch (title) {
      case "無故未到":
        return AppColor.black;
      case "臨時取消":
        return AppColor.white;
      default:
        return AppColor.black;
    }
  }

  Color setBackGroundColor(String title) {
    switch (title) {
      case "無故未到":
        return AppColor.tag_yellow;
      case "臨時取消":
        return AppColor.tag_red;
      default:
        return AppColor.tag_yellow;
    }
  }
}
