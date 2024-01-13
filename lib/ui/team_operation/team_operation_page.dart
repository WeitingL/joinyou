import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/ui/team_operation/team_infomation_page.dart';

import '../../data/data_team.dart';
import '../../data/team_data_type.dart';

// enum InfoType { MasterPage, MemberPage, MemberPageAleardyJoin }

class TeamOperationPage extends StatefulWidget {
  InfoType infoType;
  TeamData teamData;

  TeamOperationPage(
      {super.key, required this.infoType, required this.teamData});

  @override
  State<TeamOperationPage> createState() => _TeamOperationPageState();
}

class _TeamOperationPageState extends State<TeamOperationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: TeamInformationLayout(teamData: widget.teamData)),
          const Positioned(child: SafeArea(child: ToolBarArea())),
        ],
      ),
      bottomNavigationBar:
      SafeArea(child: OperationBottomBar(infoType: widget.infoType)),
    );
  }
}

class OperationBottomBar extends StatefulWidget {
  InfoType infoType;

  OperationBottomBar({super.key, required this.infoType});

  @override
  State<OperationBottomBar> createState() => _OperationBottomBarState();
}

class _OperationBottomBarState extends State<OperationBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1))),
        height: 75,
        width: MediaQuery
            .of(context)
            .size
            .width,
            child: Column(children: [
              if (widget.infoType == InfoType.MasterPage)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        GestureDetector(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.title_green,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text("開始排點",
                                    style: TextStyle(color: AppColor.white))))
                  ],
                )
              else
                if (widget.infoType == InfoType.MemberPage)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          border: Border.all(
                                              color: AppColor.title_green,
                                              width: 1),
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: const Center(
                                          child: Text("立刻報名",
                                              style: TextStyle(
                                                  color: AppColor
                                                      .title_green))))))),
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: AppColor.title_green,
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      child: const Center(
                                          child: Text("已報名球友",
                                              style: TextStyle(
                                                  color: AppColor.white)))))))
                    ],
                  )
                else
                  if (widget.infoType == InfoType.MemberPageAleardyJoin)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {},
                                child: const Text("退出球隊",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.blue)))),
                      ],
                    )
            ]));
  }
}
