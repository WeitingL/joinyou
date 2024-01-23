import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../component/bottom_bar.dart';

class TeamMatchPage extends StatefulWidget {
  const TeamMatchPage({Key? key}) : super(key: key);

  @override
  State<TeamMatchPage> createState() => _TeamMatchPageState();
}

class _TeamMatchPageState extends State<TeamMatchPage> {
  int _selectedIndex = 0;

  static const List<String> _players = <String>[
    '選項一',
    '選項二',
    '選項三',
    '選項四',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title at center with left arrow to and bottom line with grey color
          title: const Text("組隊"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
            child: Divider(
              color: Colors.grey, // Divider 的顏色
              height: 1.0,
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 12),
                      Text("選擇一個組隊隊友", style: TextStyle(fontSize: 18)),
                      for (var index = 0; index < _players.length; index++) ...[
                        PlayerItem(
                            isSelected: _selectedIndex == index,
                            name: _players[index],
                            onTap: () {
                              _onItemTapped(index);
                            }),
                        Divider()
                      ]
                    ]))),
        bottomNavigationBar: SafeArea(
            child: BottomBarCenterButton(
          action: () {
            context.pop();
          },
          content: "組隊",
        )));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class PlayerItem extends StatelessWidget {
  bool isSelected;
  String name;
  Function onTap;

  PlayerItem(
      {required this.isSelected, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name, style: TextStyle(fontSize: 18)),
                if (isSelected) Icon(Icons.check_circle, color: Colors.green)
              ],
            )));
  }
}
