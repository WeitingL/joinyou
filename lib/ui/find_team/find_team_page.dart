import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

import '../component/team_card.dart';

class FindTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FindTeam();
}

class _FindTeam extends State<FindTeam> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 24),
                const FilterBar(),
                const Expanded(child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard()
                    ],
                  ),
                ))
              ],
            )));
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
          color: AppColor.grey, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton(
            items: const [
              DropdownMenuItem(child: Text("1"), value: 1),
              DropdownMenuItem(child: Text("2"), value: 2),
            ],
            hint: const Text("地點"),
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
            hint: const Text("時間"),
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
            hint: const Text("程度"),
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
            hint: const Text("評分"),
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
