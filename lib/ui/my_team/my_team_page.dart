import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/data/data_team.dart';

import '../component/dialog.dart';
import '../component/team_card.dart';
import '../current_team/current_page.dart';

class MyTeamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTeamPage();
}

class _MyTeamPage extends State<MyTeamPage> {
  bool _isFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SwitcherTabsArea(onPressLis: (bool b) {
                      setPage(b);
                    }),
                    Container(height: 20),
                    Expanded(child: _isFirstPage ? FirstPage() : SecondPage())
                  ],
                ),
                Positioned(
                    bottom: 20,
                    right: 0,
                    child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ManageTeamDialog();
                              });
                        },
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                              color: AppColor.title_green,
                              shape: BoxShape.circle),
                          child: const Icon(Icons.add, color: AppColor.white),
                        )))
              ],
            )));
  }

  void setPage(bool isFirstPage) {
    setState(() {
      _isFirstPage = isFirstPage;
    });
  }
}

class SwitcherTabsArea extends StatefulWidget {
  Function(bool) onPressLis;

  SwitcherTabsArea({super.key, required this.onPressLis});

  @override
  State<StatefulWidget> createState() => _SwitcherTabsArea();
}

class _SwitcherTabsArea extends State<SwitcherTabsArea> {
  bool _firstPage = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 340,
        decoration: BoxDecoration(
            color: AppColor.text_grey_E6,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: SwitcherTab(
                    title: "我的臨打",
                    isSelected: _firstPage,
                    onPress: changePage)),
            Expanded(
                child: SwitcherTab(
                    title: "管理球隊",
                    isSelected: !_firstPage,
                    onPress: changePage))
          ],
        ));
  }

  void changePage() {
    setState(() {
      _firstPage = !_firstPage;
      widget.onPressLis(_firstPage);
    });
  }
}

class SwitcherTab extends StatelessWidget {
  String title;
  bool isSelected;
  VoidCallback onPress;

  SwitcherTab(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    isSelected ? AppColor.white : AppColor.transparent,
                shadowColor: AppColor.transparent,
                surfaceTintColor: AppColor.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onPress,
            child: Text(
              title,
              style: TextStyle(
                  color: isSelected ? AppColor.black : AppColor.text_grey_51),
            )));
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // button
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CurrentTeamPage()),
                );
              },
              child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: AppColor.title_green, width: 2)),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/ic_team_im.png"),
                          color: AppColor.title_green,
                          size: 30.0,
                        ),
                        Text("即時球隊",
                            style: TextStyle(
                                color: AppColor.title_green,
                                fontWeight: FontWeight.w800,
                                fontSize: 15)),
                        Icon(Icons.arrow_forward_ios,
                            size: 18.0, color: AppColor.title_green)
                      ]))),
          // List
          TeamCard(teamData: TeamData(),onTap: () {}),
          TeamCard(teamData: TeamData(),onTap: () {}),
          TeamCard(teamData: TeamData(),onTap: () {})
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TeamCard(teamData: TeamData(), onTap: () {}),
          TeamCard(teamData: TeamData(), onTap: () {})
        ],
      ),
    );
  }
}
