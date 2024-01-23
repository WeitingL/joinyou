import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeamMemberListPage extends StatefulWidget {
  const TeamMemberListPage({Key? key}) : super(key: key);

  @override
  State<TeamMemberListPage> createState() => _TeamMemberListPageState();
}

class _TeamMemberListPageState extends State<TeamMemberListPage> {
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
          title: const Text("報名清單"),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12),
                for (var player in _players) ...[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        children: [
                          Text(player, style: TextStyle(fontSize: 18))
                        ],
                      )),
                  Divider(height: 12)
                ]
              ],
            )));
  }
}
