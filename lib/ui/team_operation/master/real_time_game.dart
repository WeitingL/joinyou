import 'package:flutter/material.dart';

import '../../../app_color.dart';

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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  onPressed: null,
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
}
