import 'package:flutter/cupertino.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/data/data_team.dart';

class TeamCard extends StatelessWidget {
  TeamData teamData;
  Function onTap;

  TeamCard({super.key, required this.teamData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Container(
            width: 340,
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.text_grey_E6, width: 2.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0)),
                      )),

                  // Content
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        teamData.teamName,
                        style: const TextStyle(
                            color: AppColor.title_green,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(teamData.address,
                          style: const TextStyle(
                              color: AppColor.text_grey_94,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                      const Text(
                        "\$200 TWD / 次",
                        style: TextStyle(
                            color: AppColor.text_grey_51,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
              //-----------------------------//

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Column(
                      children: [Text("時段"), Text(teamData.timeSlot)],
                    )),
                    Flexible(
                        child: Container(
                      width: 1,
                      height: 23,
                      color: AppColor.black,
                    )),
                    Flexible(
                        child: Column(
                      children: [Text("程度"), Text(teamData.level)],
                    )),
                    Flexible(
                        child: Container(
                      width: 1,
                      height: 23,
                      color: AppColor.black,
                    )),
                    const Flexible(
                        child: Column(
                      children: [Text("距離"), Text("0.5 KM")],
                    ))
                  ])
            ])));
  }
}
