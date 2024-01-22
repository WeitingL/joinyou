import 'package:flutter/material.dart';

import '../../../app_color.dart';
import '../../component/edit_components.dart';

class RealTimeGame extends StatefulWidget {
  const RealTimeGame({super.key});

  @override
  State<RealTimeGame> createState() => _RealTimeGameState();
}

class _RealTimeGameState extends State<RealTimeGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title at center with left arrow to and bottom line with grey color
          title: const Text("即時動態"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Container(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.6,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    PlayGroundLayout(),
                    PlayGroundLayout(),
                    PlayGroundLayout(),
                    PlayGroundLayout()
                  ]),

              // Player in queue
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("排隊中",
                      style:
                          TextStyle(color: AppColor.title_green, fontSize: 14)),
                ],
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColor.title_green, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          // Used for loop to create the Text with name and spacer between 10.
                          for (var i = 0; i < 10; i++)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("玩家 $i",
                                  style: const TextStyle(
                                      color: AppColor.black, fontSize: 14)),
                            )
                        ],
                      ))),
            ],
          ),
        ));
  }
}

class PlayGroundLayout extends StatefulWidget {
  const PlayGroundLayout({super.key});

  @override
  State<PlayGroundLayout> createState() => _PlayGroundLayoutState();
}

class _PlayGroundLayoutState extends State<PlayGroundLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title area
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text("場地 A",
                    style:
                        TextStyle(color: AppColor.title_green, fontSize: 14)),
                Expanded(child: SizedBox()),
                Text("00:00",
                    style: TextStyle(color: AppColor.black, fontSize: 14)),
              ],
            )),

        // Game selected area
        const SizedBox(height: 8),
        SizedBox(
            height: 25,
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: _showChangePlayerDialog,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: const BorderSide(color: AppColor.title_green),
                  ),
                  child: const Text("更換",
                      style: TextStyle(
                          color: AppColor.title_green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                const Expanded(child: SizedBox()),
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: const BorderSide(color: AppColor.tag_red),
                  ),
                  child: const Text("結束",
                      style: TextStyle(
                          color: AppColor.tag_red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            )),

        // Game info area
        const SizedBox(height: 14),
        Flexible(
            child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.title_green, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("選手1"),
              Text("選手2"),
              Divider(color: AppColor.title_green, height: 1, thickness: 1),
              Text("選手3"),
              Text("選手4")
            ],
          ),
        ))
      ],
    );
  }

  // show a dialog to change the player in that game, the UI includes the current player and the player with text.
  void _showChangePlayerDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.white,
            surfaceTintColor: AppColor.white,
            content: Container(
                height: 330, child: Center(child: ChangePlayerDialog())),
          );
        });
  }
}

class ChangePlayerDialog extends StatelessWidget {
  const ChangePlayerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "更換球友(場地Ａ)",
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
        Text("請選擇替換球友以及被替換球友",
            style: TextStyle(fontSize: 16, color: AppColor.text_grey_94)),
        SizedBox(height: 10),
        DropDownSelected(
          title: "被更換球友",
          dropTitle: "請選擇球友",
          onChanged: (value) {},
          items: [
            DropdownMenuItem(
              child: Text("選手1"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("選手2"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("選手3"),
              value: 3,
            ),
          ],
        ),
        SizedBox(height: 10),
        DropDownSelected(
          title: "替換球友",
          dropTitle: "請選擇球友",
          onChanged: (value) {},
          items: [
            DropdownMenuItem(
              child: Text("選手1"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("選手2"),
              value: 2,
            ),
            DropdownMenuItem(
              child: Text("選手3"),
              value: 3,
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: AppColor.blue),
              ),
              child: const Text("自動替換",
                  style: TextStyle(
                      color: AppColor.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            )),
            const SizedBox(width: 8),
            Expanded(
                child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColor.title_green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: const BorderSide(color: AppColor.title_green),
              ),
              child: const Text("確定更換",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            )),
          ],
        )
      ],
    );
  }
}
