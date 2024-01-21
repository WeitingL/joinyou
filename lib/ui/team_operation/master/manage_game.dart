import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:joinyou/app_color.dart';

import '../../component/title_switch_bar.dart';

class ManageGame extends StatefulWidget {
  @override
  State<ManageGame> createState() => _ManageGameState();
}

enum ManageGameType { TeamMemberState, TeamChallenge, TeamMatchRequest }

class _ManageGameState extends State<ManageGame> {

  ManageGameType _manageGameType = ManageGameType.TeamMemberState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title at center with left arrow to and bottom line with grey color
          title: const Text("球隊管理"),
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
                SwitcherBar(
                    options: ["球友管理", "挑戰請求", "組隊請求"],
                    onPress: (index) {
                      setState(() {
                        switch (index) {
                          case 0:
                            _manageGameType = ManageGameType.TeamMemberState;
                            break;
                          case 1:
                            _manageGameType = ManageGameType.TeamChallenge;
                            break;
                          case 2:
                            _manageGameType = ManageGameType.TeamMatchRequest;
                            break;
                        }
                      });
                    },
                    isLoading: false
                ),
                SizedBox(height: 16),
                Expanded(
                    child: _manageGameType == ManageGameType.TeamMemberState
                        ? TeamMemberStatePage()
                        : _manageGameType == ManageGameType.TeamChallenge
                            ? TeamChallengePageState()
                            : TeamMatchRequestPage()
                )
              ],
            )
        ));
  }
}

// TeamMemberState ----------
class TeamMemberStateItem extends StatefulWidget {
  @override
  State<TeamMemberStateItem> createState() => _TeamMemberStateItemState();
}

class _TeamMemberStateItemState extends State<TeamMemberStateItem> {
  bool _isPaid = false;
  bool _isStoping = false;
  int _gameCount = 0;
  int _score = 12;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text("王大陸",
                    style: TextStyle(color: AppColor.black, fontSize: 18)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("上場次數 $_gameCount",
                        style: TextStyle(color: AppColor.black, fontSize: 18)),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: _showDialog,
                      child: Icon(Icons.edit, size: 20),
                    ),
                    SizedBox(width: 13),
                    Container(
                      width: 1,
                      height: 20,
                      color: AppColor.text_grey_E6,
                    ),
                    SizedBox(width: 13),
                    Text("積分 $_score",
                        style: TextStyle(
                            color: AppColor.title_green, fontSize: 18)),
                  ],
                )
              ],
            ),
            Expanded(child: SizedBox()),
            OutlinedButton(
              onPressed: _paidAction,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                side: BorderSide(
                    color: _isPaid ? AppColor.title_green : AppColor.tag_red),
              ),
              child: Text(_isPaid ? "已繳費" : "未繳費",
                  style: TextStyle(
                      color: _isPaid ? AppColor.title_green : AppColor.tag_red,
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(height: 1, color: AppColor.text_grey_E6)
      ],
    );
  }

  void _paidAction() {
    setState(() {
      _isPaid = !_isPaid;
    });
  }

  // show dialog to inter teh game number
  void _showDialog() {
    int tmpGameCount = _gameCount;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("請輸入上場次數"),
            content: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "請輸入上場次數"),
              onChanged: (value) {
                setState(() {
                  tmpGameCount = int.parse(value);
                });
              },
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("取消")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _gameCount = tmpGameCount;
                    });
                    Navigator.pop(context);
                  },
                  child: Text("確定"))
            ],
          );
        });
  }
}

class TeamMemberStatePage extends StatefulWidget {
  @override
  State<TeamMemberStatePage> createState() => _TeamMemberStatePage();
}

class _TeamMemberStatePage extends State<TeamMemberStatePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        TeamMemberStateItem(),
        TeamMemberStateItem(),
        TeamMemberStateItem(),
        TeamMemberStateItem(),
        TeamMemberStateItem()
      ],
    ));
  }
}

// TeamMemberState ----------

// TeamChallengePage ----------

class TeamChallengePageState extends StatefulWidget {
  @override
  State<TeamChallengePageState> createState() => _TeamChallengePageState();
}

class _TeamChallengePageState extends State<TeamChallengePageState> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        TeamChallengeItem(),
        TeamChallengeItem(),
        TeamChallengeItem(),
        TeamChallengeItem(),
        TeamChallengeItem()
      ],
    ));
  }
}

class TeamChallengeItem extends StatefulWidget {
  const TeamChallengeItem({super.key});

  @override
  State<TeamChallengeItem> createState() => _TeamChallengeItemState();
}

class _TeamChallengeItemState extends State<TeamChallengeItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        Row(
          children: [
            Container(
              width: 125,
              height: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_94, width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("data"), Text("data")],
              ),
            ),
            Container(
              width: 125,
              height: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_94, width: 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("data"), Text("data")],
              ),
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: BorderSide(color: AppColor.title_green),
                  ),
                  child: Text("確認",
                      style: TextStyle(
                          color: AppColor.title_green,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: BorderSide(color: AppColor.tag_red),
                  ),
                  child: Text("取消",
                      style: TextStyle(
                          color: AppColor.tag_red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12),
        Divider(height: 1, color: AppColor.text_grey_E6),
      ],
    );
  }
}

// TeamChallengePage ----------

// TeamMatchRequestPage ----------

class TeamMatchRequestPage extends StatefulWidget {
  @override
  State<TeamMatchRequestPage> createState() => _TeamMatchRequestPageState();
}

class _TeamMatchRequestPageState extends State<TeamMatchRequestPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        TeamMatchRequestItem(),
        TeamMatchRequestItem(),
        TeamMatchRequestItem(),
        TeamMatchRequestItem(),
        TeamMatchRequestItem()
      ],
    ));
  }
}

class TeamMatchRequestItem extends StatefulWidget {
  @override
  State<TeamMatchRequestItem> createState() => _TeamMatchRequestItemState();
}

class _TeamMatchRequestItemState extends State<TeamMatchRequestItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        Row(
          children: [
            Container(
              width: 125,
              height: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_94, width: 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Center(child: Text("data")),
            ),
            Container(
              width: 125,
              height: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.text_grey_94, width: 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(child: Text("data")),
            ),
            Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: BorderSide(color: AppColor.title_green),
                  ),
                  child: Text("確認",
                      style: TextStyle(
                          color: AppColor.title_green,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: BorderSide(color: AppColor.tag_red),
                  ),
                  child: Text("取消",
                      style: TextStyle(
                          color: AppColor.tag_red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 12),
        Divider(height: 1, color: AppColor.text_grey_E6),
      ],
    );
  }

}

// TeamMatchRequestPage ----------
