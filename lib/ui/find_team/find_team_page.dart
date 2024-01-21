import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/ui/find_team/find_team_bloc.dart';

import '../../data/team_data_type.dart';
import '../component/loading.dart';
import '../component/team_card.dart';
import '../team_operation/team_operation_page.dart';
import 'find_team_map.dart';

class FindTeam extends StatelessWidget {
  const FindTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TeamListCubit(),
        child: BlocBuilder<TeamListCubit, IFindTeamState>(
            builder: (context, state) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Stack(alignment: Alignment.center, children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(height: 24),
                          const ResearchArea(),
                          Container(height: 24),
                          const FilterBar(),
                          if (state is LoadingState)
                            Expanded(child: Center(child: Loading(size: 30)))
                          else if (state is FindTeamViewState)
                            Expanded(
                                child: SingleChildScrollView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Column(
                                      children: [
                                        for (var team in state.teamList)
                                          TeamCard(
                                            teamData: team,
                                            onTap: () {
                                              GoRouter.of(context).push("/team_operation",
                                                  extra: {"teamData": team, "infoType": InfoType.MasterPage});
                                            },
                                            onShareTap: () {},
                                          )
                                      ],
                                    )))
                        ],
                      ),
                      Positioned(
                          bottom: 20,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FindTeamByMap()));
                            },
                            child: Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: AppColor.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "地圖",
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.map, color: AppColor.white)
                                ],
                              ),
                            ),
                          ))
                    ]))));
  }
}

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<StatefulWidget> createState() => _FilterBar();
}

class _FilterBar extends State<FilterBar> {
  String location = "地點";
  String time = "時間";
  String level = "程度";
  String score = "評分";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.text_grey_E6,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton(
            items: const [
              DropdownMenuItem(child: Text("1"), value: 1),
              DropdownMenuItem(child: Text("2"), value: 2),
            ],
            hint: const Text("地點",
                style: TextStyle(color: AppColor.text_grey_51)),
            onChanged: (value) {},
            underline: Container(height: 0),
            icon: const Icon(Icons.expand_more),
            style: const TextStyle(
                backgroundColor: AppColor.transparent, color: AppColor.black),
          ),

          Container(height: 24, width: 1, color: AppColor.black),
//---------------------------------------------------------------------//
          DropdownButton(
            items: const [
              DropdownMenuItem(child: Text("1"), value: 1),
              DropdownMenuItem(child: Text("2"), value: 2),
            ],
            hint: const Text("時間",
                style: TextStyle(color: AppColor.text_grey_51)),
            onChanged: (value) {},
            underline: Container(height: 0),
            icon: const Icon(Icons.expand_more),
            style: const TextStyle(
                backgroundColor: AppColor.transparent, color: AppColor.black),
          ),

          Container(height: 24, width: 1, color: AppColor.black),
//---------------------------------------------------------------------//
          DropdownButton(
            items: const [
              DropdownMenuItem(child: Text("1"), value: 1),
              DropdownMenuItem(child: Text("2"), value: 2),
            ],
            hint: const Text("程度",
                style: TextStyle(color: AppColor.text_grey_51)),
            onChanged: (value) {},
            underline: Container(height: 0),
            icon: const Icon(Icons.expand_more),
            style: const TextStyle(
                backgroundColor: AppColor.transparent, color: AppColor.black),
          ),

          Container(height: 24, width: 1, color: AppColor.black),
//---------------------------------------------------------------------//
          DropdownButton(
            items: const [
              DropdownMenuItem(child: Text("1"), value: 1),
              DropdownMenuItem(child: Text("2"), value: 2),
            ],
            hint: const Text("評分",
                style: TextStyle(color: AppColor.text_grey_51)),
            onChanged: (value) {},
            underline: Container(height: 0),
            icon: const Icon(Icons.expand_more),
            style: const TextStyle(
                backgroundColor: AppColor.transparent, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}

class ResearchArea extends StatefulWidget {
  const ResearchArea({super.key});

  @override
  State<StatefulWidget> createState() => _ResearchArea();
}

class _ResearchArea extends State<ResearchArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: AppColor.text_grey_E6,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const TextField(
          decoration: InputDecoration(
              hintText: "搜尋關鍵字",
              hintStyle: TextStyle(color: AppColor.text_grey_94),
              icon: Icon(Icons.search),
              iconColor: AppColor.text_grey_94,
              border: InputBorder.none),
        ));
  }
}
