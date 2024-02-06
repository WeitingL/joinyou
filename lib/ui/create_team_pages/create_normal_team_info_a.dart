import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../NavigationHelper.dart';
import '../component/bottom_bar.dart';
import '../component/edit_components.dart';

class CreateTeamPageA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateTeamPageA();
}

class _CreateTeamPageA extends State<CreateTeamPageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text("新增球隊資訊"),
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
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(height: 20),
                EditTextContentArea(title: "球隊名稱", hintTitle: "請輸入球隊名稱"),
                SizedBox(height: 20),
                EditTextContentArea(title: "團主名稱", hintTitle: "請輸入團主名稱"),
                SizedBox(height: 20),
                DropDownSelected(
                  title: "場地數量",
                  dropTitle: "請選擇場地數量",
                  onChanged: (int? value) {},
                  items: [
                    ...[
                      for (int i = 1; i <= 9; i++)
                        DropdownMenuItem(
                          value: i,
                          child: Text(i.toString()),
                        )
                    ]
                  ],
                ),
                SizedBox(height: 20),
                EditTextContentArea(title: "比賽用球", hintTitle: "請輸入比賽用球"),
                SizedBox(height: 20),
                EditTextContentArea(title: "球館名稱(選填)", hintTitle: "請輸入球館名稱"),
              ],
            ))),
        bottomNavigationBar:
            SafeArea(child: BottomBarNext(content: "下一步", action: () {
              GoRouter.of(context).push(NavigationHelper.CREATE_TEAM_PAGE_B);
            })));
  }
}
