import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/ui/team_operation/team_infomation_page.dart';

import '../../data/data_team.dart';
import '../../data/team_data_type.dart';

// enum InfoType { MasterPage, MemberPage }

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
    return BlocProvider(
        create: (context) => TeamOperationCubit(),
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                  child: TeamInformationLayout(
                      teamData: widget.teamData, commentList: [])),
              const Positioned(child: SafeArea(child: ToolBarArea())),
            ],
          ),
          bottomNavigationBar: SafeArea(child: OperationBottomBar()),
        ));
  }
}

class OperationBottomBar extends StatelessWidget {
  OperationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 1))),
        height: 75,
        width: MediaQuery.of(context).size.width,
        child: Container());
  }
}
