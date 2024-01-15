import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/ui/team_operation/team_infomation_page.dart';

import '../../data/data_team.dart';
import '../../data/team_data_type.dart';

// enum InfoType { MasterPage, MemberPage }
class TeamOperationPage extends StatefulWidget {
  TeamData teamData;

  TeamOperationPage({super.key, required this.teamData});

  @override
  State<TeamOperationPage> createState() => _TeamOperationPageState();
}

class _TeamOperationPageState extends State<TeamOperationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: TeamInformationLayout(
                  teamData: widget.teamData,
                  commentList:
                      context.watch<TeamOperationCubit>().commentList)),
          Positioned(child: SafeArea(child:
              BlocBuilder<TeamOperationCubit, ITeamOperationState>(
                  builder: (context, state) {
            if (state is TeamOptMasterState) {
              return ToolBarAreaForMaster();
            } else if (state is TeamOptMemberState) {
              return ToolBarAreaForMember();
            } else if (state is TeamOptMemberJoinedState) {
              return ToolBarAreaForMember();
            } else {
              return Container();
            }
          }))),
        ],
      ),
      bottomNavigationBar: SafeArea(child:
          BlocBuilder<TeamOperationCubit, ITeamOperationState>(
              builder: (context, state) {
        if (state is TeamOptMasterState) {
          return BottomBarForMaster();
        } else if (state is TeamOptMemberState) {
          return BottomBarForMember();
        } else if (state is TeamOptMemberJoinedState) {
          return BottomBarForMemberJoined();
        } else {
          return Container();
        }
      })),
    );
  }
}

class BottomBarForMaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        height: 70,
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(
                top: BorderSide(color: AppColor.text_grey_94, width: 1))),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<TeamOperationCubit>().joinTeam();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.title_green),
                        child: const Center(
                            child: Text("開始排點",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))))))
          ],
        ));
  }
}

class BottomBarForMember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        height: 70,
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(
                top: BorderSide(color: AppColor.text_grey_94, width: 1))),
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<TeamOperationCubit>().joinTeam();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.title_green, width: 1),
                            color: AppColor.white),
                        child: const Center(
                            child: Text("立即報名",
                                style: TextStyle(
                                    color: AppColor.title_green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)))))),
            const SizedBox(width: 10),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<TeamOperationCubit>().joinTeam();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColor.title_green),
                        child: const Center(
                            child: Text("已報名球友",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))))))
          ],
        ));
  }
}

class BottomBarForMemberJoined extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        height: 70,
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border(
                top: BorderSide(color: AppColor.text_grey_94, width: 1))),
        child: Row(
          children: [
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<TeamOperationCubit>().leaveTeam();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.tag_red, width: 1),
                            color: AppColor.white),
                        child: const Center(
                            child: Text("取消報名",
                                style: TextStyle(
                                    color: AppColor.tag_red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)))))),
            const SizedBox(width: 10),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      context.read<TeamOperationCubit>().leaveTeam();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.title_green),
                        child: const Center(
                            child: Text("報到",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15))))))
          ],
        ));
  }
}
