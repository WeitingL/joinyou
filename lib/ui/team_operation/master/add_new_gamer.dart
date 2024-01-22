import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app_color.dart';
import '../../component/bottom_bar.dart';
import '../../component/edit_components.dart';

class AddNewGamePlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddNewGamePlayerState();
}

class _AddNewGamePlayerState extends State<AddNewGamePlayer> {
  static const List<DropdownMenuItem<int>> _items = [
    DropdownMenuItem(child: Text("初階"), value: 1),
    DropdownMenuItem(child: Text("中階"), value: 2),
    DropdownMenuItem(child: Text("高階"), value: 3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title at center with left arrow to and bottom line with grey color
          title: const Text("新增臨時球友"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0), // 設置 Divider 的高度
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
                SizedBox(height: 16),
                EditTextContentArea(title: "名稱", hintTitle: "請輸入名稱"),
                SizedBox(height: 16),
                DropDownSelected(
                  title: "程度",
                  dropTitle: "請選擇程度",
                  items: _items,
                  onChanged: (int) {},
                )
              ],
            )),
        bottomNavigationBar: SafeArea(
            child: BottomBarCenterButton(
          action: () {},
          content: '新增',
        )));
  }
}
