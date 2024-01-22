import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

class BottomBarNext extends StatelessWidget {
  VoidCallback action;
  String content;

  BottomBarNext({super.key, required this.action, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: action,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColor.title_green,
                    borderRadius: BorderRadius.circular(30)),
                width: 80,
                height: 40,
                child: Center(
                    child: Text(content,
                        style: const TextStyle(
                            color: AppColor.white, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center)))),
        const SizedBox(width: 12)
      ],
    );
  }
}

// build a buttonbar with a vertical divider and button
class BottomBarCenterButton extends StatelessWidget {
  VoidCallback action;
  String content;

  BottomBarCenterButton({super.key, required this.action, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(),
            GestureDetector(
                onTap: action,
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.title_green,
                        borderRadius: BorderRadius.circular(10)),
                    //width is the screen width
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: Center(
                        child: Text(content,
                            style: const TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center)))),
            const SizedBox(width: 12)
          ],
        ));
  }
}
