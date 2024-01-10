import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/data/data_team.dart';

import '../component/dialog.dart';
import '../component/loading.dart';
import '../component/team_card.dart';
import '../current_team/current_page.dart';
import '../team_operation/master/game_prepare.dart';
import '../team_operation/team_infomation_page.dart';
import 'my_team_bloc.dart';

class MyTeamPage extends StatefulWidget {
  const MyTeamPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyTeamPage();
}

class _MyTeamPage extends State<MyTeamPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyTeamCubit(),
        child: BlocBuilder<MyTeamCubit, IMyTeamState>(
            builder: (context, state) => Expanded(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            SwitcherTabsArea(onPressLis: (bool isFirstPage) {
                              if (isFirstPage) {
                                context.read<MyTeamCubit>().getMyTeam();
                              } else {
                                context.read<MyTeamCubit>().getMyPlayList();
                              }
                            }),
                            Container(height: 20),
                            if (state is MyTeamState)
                              Expanded(child: FirstPage(myTeams: state.myTeams))
                            else if (state is MyPlayListState)
                              Expanded(
                                  child: SecondPage(myTeams: state.myPlayList))
                            else
                              Expanded(child: Center(child: Loading(size: 30)))
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
                                  child: const Icon(Icons.add,
                                      color: AppColor.white),
                                )))
                      ],
                    )))));
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
                    onPress: () {
                      if (_firstPage == false) {
                        changePage();
                      }
                    })),
            Expanded(
                child: SwitcherTab(
                    title: "管理球隊",
                    isSelected: !_firstPage,
                    onPress: () {
                      if (_firstPage == true) {
                        changePage();
                      }
                    }))
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
  late List<TeamData> myTeams;

  FirstPage({super.key, required this.myTeams});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
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
                  border: Border.all(color: AppColor.title_green, width: 2)),
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
      for (var i = 0; i < myTeams.length; i++)
        TeamCard(teamData: myTeams[i], onTap: () {}, onShareTap: () {})
    ]));
  }
}

class SecondPage extends StatelessWidget {
  late List<TeamData> myTeams;

  SecondPage({super.key, required this.myTeams});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < myTeams.length; i++)
            TeamCard(
                teamData: myTeams[i],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MasterGamePrepare(teamData: myTeams[i])),
                  );
                },
                onShareTap: () {})
        ],
      ),
    );
  }
}

class CommonBtn extends StatelessWidget {
  String title;
  VoidCallback onPressed;

  CommonBtn({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(title));
  }
}
