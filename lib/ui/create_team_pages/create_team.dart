import 'package:flutter/material.dart';

import '../component/bottom_bar.dart';
import '../component/edit_components.dart';

class CreateTeamPage extends StatefulWidget {
  const CreateTeamPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateTeamPage();
}

class _CreateTeamPage extends State<CreateTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("即時球隊"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
          child: Container(
            color: Colors.grey, // Divider 的顏色
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      DropDownSelected(title: "場地數", dropTitle: "請選擇場地數"),
                      SizedBox(height: 20),
                      EditNumContentArea(title: "打球時長", hintTitle: "請輸入打球時長"),
                      SizedBox(height: 20),
                      LeaderSelector(),
                    ])),
            const Spacer(),
            const Divider(),
            BottomBarNext(
                content: "確認",
                action: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}

class LeaderSelector extends StatefulWidget {
  const LeaderSelector({super.key});

  @override
  State<StatefulWidget> createState() => _LeaderSelector();
}

class _LeaderSelector extends State<LeaderSelector> {
  bool selectedValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: 8, bottom: 4),
            child: Text(
              "團主是否為球友",
              style: TextStyle(fontSize: 18),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: Row(
              children: [
                Radio(
                  value: true,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setValue(value as bool);
                  },
                ),
                const Text('是'),
              ],
            )),
            Flexible(
                child: Row(
              children: [
                Radio(
                  value: false,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setValue(value as bool);
                  },
                ),
                const Text('否'),
              ],
            ))
          ],
        )
      ],
    );
  }

  void setValue(bool value) {
    setState(() {
      selectedValue = value;
    });
  }
}
