import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../NavigationHelper.dart';
import '../../app_color.dart';
import '../component/bottom_bar.dart';
import '../component/edit_components.dart';

class CreateTeamPageB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateTeamPageB();
}

class _CreateTeamPageB extends State<CreateTeamPageB> {
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
                RangeSliderWidget(),
                SizedBox(height: 20),
                EditTextContentArea(title: "費用 - 男", hintTitle: "請輸入男球友費用"),
                SizedBox(height: 20),
                EditTextContentArea(title: "費用 - 女", hintTitle: "請輸入女球友費用"),
                SizedBox(height: 20),
                EditTextContentArea(title: "其他說明", hintTitle: "請輸入說明"),
              ],
            ))),
        bottomNavigationBar:
            SafeArea(child: BottomBarNext(content: "下一步", action: () {
              GoRouter.of(context).go(NavigationHelper.MY_TEAM_PAGE);
            })));
  }
}

// create range slider widget to select the 4 levels
class RangeSliderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RangeSliderWidget();
}

class _RangeSliderWidget extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 2);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text("程度", style: TextStyle(fontSize: 18)),
          Spacer(),
          Text(getLevelText(_currentRangeValues),
              style: TextStyle(color: AppColor.title_green, fontSize: 16)),
          SizedBox(width: 5),
          Icon(Icons.info_outline, color: AppColor.title_green),
        ],
      ),
      RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 2,
          divisions: 2,
          activeColor: AppColor.title_green,
          inactiveColor: AppColor.text_grey_94,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          })
    ]);
  }

  String getLevelText(RangeValues level) {
    var start = level.start;
    var end = level.end;

    if (start == 0 && end == 0) {
      return "初級";
    } else if (start == 1 && end == 1) {
      return "中級";
    } else if (start == 2 && end == 2) {
      return "高級";
    } else {
      if (start == 0 && end == 1) {
        return "初級 - 中級";
      } else if (start == 1 && end == 2) {
        return "中級 - 高級";
      } else {
        return "初級 - 高級";
      }
    }
  }
}
