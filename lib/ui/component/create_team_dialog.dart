import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/app_color.dart';

import '../../NavigationHelper.dart';
import '../create_team_pages/create_normal_team.dart';
import '../create_team_pages/create_team.dart';

class CreateTeamDialog extends StatelessWidget {
  const CreateTeamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {context.pop();},
        child: AlertDialog(
            backgroundColor: AppColor.transparent,
            surfaceTintColor: AppColor.transparent,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      context.pop();
                      context.push(NavigationHelper.CREATE_TEAM_PAGE);
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text("一般\n刊登",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.title_green,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600))),
                    )),
                Container(width: 8),
                GestureDetector(
                    onTap: () {
                      context.pop();
                      context.push(NavigationHelper.FAST_CREATE_TEAM_PAGE);
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text("即時\n創建",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.title_green,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600))),
                    ))
              ],
            )));
  }
}
