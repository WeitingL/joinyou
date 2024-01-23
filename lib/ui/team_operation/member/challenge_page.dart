import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/app_color.dart';

import '../../component/bottom_bar.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<StatefulWidget> createState() => _ChallengePage();
}

class _ChallengePage extends State<ChallengePage> {
  int _selectedIndex = 0;

  static const List<List<String>> _players = [
    ["王大陸1", "王大陸2"],
    ["王大陸3", "王大陸4"],
    ["王大陸5", "王大陸6"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title at center with left arrow to and bottom line with grey color
        title: const Text("挑戰"),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 12),
              Text(
                "選擇一個挑戰組合",
                style: TextStyle(fontSize: 18),
              ),
              for (var index = 0; index < _players.length; index++) ...[
                SizedBox(height: 12),
                MemberChallengeItem(
                    isSelect: _selectedIndex == index,
                    player: _players[index],
                    onTap: () {
                      _onItemTapped(index);
                    })
              ]
            ],
          )),
      bottomNavigationBar: SafeArea(
          child: BottomBarCenterButton(
              action: () {
                context.pop();
              },
              content: "確定")),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MemberChallengeItem extends StatelessWidget {
  bool isSelect;
  List<String> player;
  Function onTap;

  MemberChallengeItem(
      {super.key,
      required this.isSelect,
      required this.player,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                  color: isSelect ? AppColor.title_green : Colors.grey,
                  width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(children: [
              Flexible(
                  flex: 3,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(player[0]),
                          Container(
                            width: 1,
                            height: 20,
                            color:
                                isSelect ? AppColor.title_green : Colors.grey,
                          ),
                          Text(player[1]),
                        ],
                      ))),
              Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (isSelect)
                        Icon(Icons.check_circle, color: AppColor.title_green)
                    ],
                  )),
            ])));
  }
}
