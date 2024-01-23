import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app_color.dart';
import '../../component/bottom_bar.dart';
import '../../component/loading.dart';
import 'bloc/GameLoadingBloc.dart';

class GameLoadingPage extends StatefulWidget {
  @override
  State<GameLoadingPage> createState() => _GameLoadingPageState();
}

class _GameLoadingPageState extends State<GameLoadingPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GameLoadingCubit(),
        child: Scaffold(
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        Loading(size: 80),
                        const SizedBox(height: 18),
                        const Text("排隊中",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w500)),
                        const Text("請稍候，若不想等待可直接點擊下方按鈕離開",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColor.text_grey_94),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 50),
                        ...[
                          BlocBuilder<GameLoadingCubit, GameLoadingState>(
                              builder: (context, state) {
                                if (state is GameLoading) {
                                  return Text(
                                      "尚有${state.alreadyInQueue}人在列隊中",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColor.title_green));
                                } else {
                                  print("state is not GameLoading");
                                  return const SizedBox(); // empty
                                }
                              }
                          )
                        ]

                      ],
                    ))),
            bottomNavigationBar: SafeArea(
                child: BottomBarCenterButton(
                  action: () {
                    context.pop();
                  },
                  content: "取消",
                ))));
  }
}
