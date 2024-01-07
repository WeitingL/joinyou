import 'package:flutter/material.dart';

import '../../app_color.dart';

class CardInformation extends StatelessWidget {
  String titleLeft;
  String titleMed;
  String titleRight;
  String contentLeft;
  String contentRight;
  String contentMed;

  CardInformation({
    super.key,
    required this.titleLeft,
    required this.titleMed,
    required this.titleRight,
    required this.contentLeft,
    required this.contentMed,
    required this.contentRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.text_grey_E6, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InfoContent(title: titleLeft, content: contentLeft),
          Container(
            width: 1,
            height: 20,
            color: AppColor.text_grey_E6,
          ),
          InfoContent(title: titleMed, content: contentMed),
          Container(
            width: 1,
            height: 20,
            color: AppColor.text_grey_E6,
          ),
          InfoContent(title: titleRight, content: contentRight)
        ],
      ),
    );
  }
}

class InfoContent extends StatelessWidget {
  String title;
  String content;

  InfoContent({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: const TextStyle(
                color: AppColor.title_green,
                fontWeight: FontWeight.w600,
                fontSize: 16)),
        Text(content,
            style: const TextStyle(color: AppColor.black, fontSize: 16))
      ],
    );
  }
}

class IconText extends StatelessWidget {
  String text;
  String iconAsset;

  IconText({super.key, required this.text, required this.iconAsset});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
            AssetImage(iconAsset),
            color: AppColor.title_green,
            size: 35.0
        ),
        const SizedBox(width: 8),
        Text(text,
            style: const TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 16
            ))
      ],
    );
  }
}
