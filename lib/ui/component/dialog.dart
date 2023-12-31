import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

import '../create_team_pages/create_normal_team.dart';
import '../create_team_pages/create_team.dart';

class ManageTeamDialog extends StatelessWidget {
  const ManageTeamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
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
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNormalTeam()));
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
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateTeamPage()));
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
