import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_color.dart';
import '../../component/bottom_bar.dart';
import '../master/start_arrange.dart';

class GameEndPage extends StatefulWidget {
  const GameEndPage({super.key});

  @override
  State<GameEndPage> createState() => _GameEndPageState();
}

enum GameResult { win, lose, non_defined }

class _GameEndPageState extends State<GameEndPage> {
  GameResult _gameResult = GameResult.non_defined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("比賽結束",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500)),
                    SizedBox(height: 12),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text("請填寫輸贏結果，並提交結果予以下次排點改善",
                            style: TextStyle(
                                fontSize: 16, color: AppColor.text_grey_94),
                            textAlign: TextAlign.center)),
                    SizedBox(height: 20),
                    Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.text_grey_E6, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("隊友",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.title_green)),
                                Text("王大陸", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              color: AppColor.text_grey_E6,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("場地",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColor.title_green)),
                                Text("A", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        )),
                    GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          RectOutlineContentArea(
                              title: "獲勝方",
                              color: _gameResult == GameResult.win
                                  ? AppColor.title_green
                                  : AppColor.text_grey_E6,
                              onTap: () {
                                setGameResult(GameResult.win);
                              }),
                          RectOutlineContentArea(
                              title: "戰敗方",
                              color: _gameResult == GameResult.lose
                                  ? AppColor.tag_red
                                  : AppColor.text_grey_E6,
                              onTap: () {
                                setGameResult(GameResult.lose);
                              }),
                        ])
                  ],
                ))),
        bottomNavigationBar: SafeArea(
            child: BottomBarCenterButton(
          action: () {
            context.pop();
          },
          content: "提交",
        )));
  }

  void setGameResult(GameResult gameResult) {
    setState(() {
      _gameResult = gameResult;
    });
  }
}
