import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/app_color.dart';
import 'package:joinyou/data/data_team.dart';
import 'package:joinyou/ui/component/image_area.dart';

import '../../NavigationHelper.dart';
import '../../data/comment_data.dart';
import '../component/comment_component.dart';
import '../component/info_component.dart';
import 'master/member_management.dart';

class ToolBarAreaForMaster extends StatelessWidget {
  const ToolBarAreaForMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColor.white)),
            const Expanded(child: SizedBox()),
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap: () {
                            GoRouter.of(context)
                                .push(NavigationHelper.MY_TEAM_MEMBER_MANAGE_PAGE);
                          },
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text("報名管理")])),
                      const PopupMenuItem(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text("編輯球隊")])),
                      const PopupMenuItem(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [Text("重新刊登")])),
                    ],
                child:
                    const Icon(Icons.more_horiz_rounded, color: AppColor.white))
          ],
        ));
  }
}

class ToolBarAreaForMember extends StatelessWidget {
  const ToolBarAreaForMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColor.white)),
            const Expanded(child: SizedBox()),
            GestureDetector(
                child: const Icon(Icons.chat_bubble_outline,
                    color: AppColor.white),
                onTap: () {})
          ],
        ));
  }
}

class TeamInformationLayout extends StatelessWidget {
  TeamData teamData;
  List<CommentData> commentList;

  TeamInformationLayout(
      {super.key, required this.teamData, required this.commentList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageArea(
            height: 260,
            width: MediaQuery.of(context).size.width,
            imageUrl: null),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  teamData.teamName,
                  style: const TextStyle(
                      color: AppColor.title_green,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                CardInformation(
                    titleLeft: "評分",
                    titleMed: "團主",
                    titleRight: "評價",
                    contentLeft: "${teamData.score} 分",
                    contentMed: teamData.teamAdmin,
                    contentRight: "${teamData.commentCount} 則"),
                const SizedBox(height: 8),
                IconText(
                    text: teamData.address,
                    iconAsset: "assets/ic_info_locate.png"),
                const SizedBox(height: 8),
                IconText(
                    text: "男 ${teamData.maleFee} / 女 ${teamData.femaleFee}",
                    iconAsset: "assets/ic_info_price.png"),
                const SizedBox(height: 8),
                IconText(
                    text: teamData.timeSlot,
                    iconAsset: "assets/ic_info_date.png"),
                const SizedBox(height: 8),
                IconText(
                    text: "需求${teamData.participantQuota}人",
                    iconAsset: "assets/ic_info_person.png"),
                const SizedBox(height: 8),
                IconText(
                    text: "${teamData.venueCount}坐球場",
                    iconAsset: "assets/ic_info_place.png"),
                const SizedBox(height: 8),
                IconText(
                    text: teamData.gameBall,
                    iconAsset: "assets/ic_info_bedminton.png"),
                const SizedBox(height: 8),
                IconText(
                    text: teamData.level,
                    iconAsset: "assets/ic_info_level.png"),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                ReviewRating(
                    onPress: () {},
                    startCount: teamData.score,
                    reviewCount: teamData.commentCount),
                const SizedBox(height: 8),
                for (var comment in commentList)
                  ReviewComment(
                      name: comment.userName,
                      date: comment.date,
                      rating: comment.rating,
                      comment: comment.comment),
                const Divider(),
              ],
            ))
      ],
    ));
  }
}
