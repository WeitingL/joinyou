import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinyou/app_color.dart';

class ReviewRating extends StatelessWidget {
  Function() onPress;
  double startCount;
  int reviewCount;

  ReviewRating(
      {super.key,
      required this.onPress,
      required this.startCount,
      required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "詳細評論",
              style: TextStyle(color: AppColor.black, fontSize: 16),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
                onTap: onPress,
                child: const Row(
                  children: [
                    Text("查看",
                        style: TextStyle(
                            color: AppColor.text_grey_94, fontSize: 16)),
                    Icon(Icons.arrow_forward_ios,
                        color: AppColor.text_grey_94, size: 16)
                  ],
                ))
          ],
        ),
        Row(
          children: [
            Text(
              startCount.toString(),
              style: const TextStyle(color: AppColor.black, fontSize: 16),
            ),
            const SizedBox(width: 8),
            StarRating(startCount: startCount.toInt(), size: 20),
            const SizedBox(width: 8),
            Text(
              "($reviewCount)",
              style: const TextStyle(color: AppColor.black, fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}

// Input the start count and show the start count by fill start icon and outline start icon
class StarRating extends StatelessWidget {
  int startCount;
  double size;

  StarRating({super.key, required this.startCount, this.size = 28});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star,
            color: i < startCount ? AppColor.title_green : AppColor.grey,
            size: size,
          )
      ],
    );
  }
}

class ReviewComment extends StatelessWidget {
  String name;
  String date;
  double rating;
  String comment;

  ReviewComment(
      {super.key,
      required this.name,
      required this.date,
      required this.rating,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ImageIcon(AssetImage("assets/ic_account_defaultphoto.png"),
            color: AppColor.title_green, size: 35.0),
        const SizedBox(width: 8),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    name,
                    style: const TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )
                ]),
                const SizedBox(width: 8),
                StarRating(startCount: rating.toInt(), size: 20),
                const SizedBox(width: 8),
                Text(
                  comment,
                  style: const TextStyle(color: AppColor.black, fontSize: 16),
                )
              ],
            ))
      ],
    );
  }
}
