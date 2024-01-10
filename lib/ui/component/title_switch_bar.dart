import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

import '../my_team/my_team_page.dart';

class SwitcherBar extends StatefulWidget {
  List<String> options;
  Function(int) onPress;
  bool isLoading;

  SwitcherBar(
      {super.key,
      required this.options,
      required this.onPress,
      required this.isLoading});

  @override
  State<StatefulWidget> createState() => _SwitcherBar();
}

class _SwitcherBar extends State<SwitcherBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        decoration: BoxDecoration(
            color: AppColor.text_grey_E6,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.options
              .map((e) => Expanded(
                  child: SwitcherTab(
                      title: e,
                      isSelected: widget.options.indexOf(e) == _selectedIndex,
                      onPress: () {
                        if(widget.isLoading) return;
                        _onItemTapped(widget.options.indexOf(e));
                      })))
              .toList(),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onPress(index);
    });
  }
}
