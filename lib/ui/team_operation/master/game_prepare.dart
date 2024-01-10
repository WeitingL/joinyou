import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/ui/team_operation/master/start_arrange.dart';

import '../../../data/data_team.dart';
import '../../component/bottom_bar.dart';
import '../team_infomation_page.dart';

class MasterGamePrepare extends StatelessWidget {
  TeamData teamData;

  MasterGamePrepare({super.key, required this.teamData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: TeamInformationLayout(teamData: teamData)),
          const Positioned(child: SafeArea(child: ToolBarArea()))
        ],
      ),
      bottomNavigationBar: SafeArea(
          child: BottomBarCenterButton(content: "開始排點", action: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return StartArrangePage();
            }));
          })),
    );
  }
}
