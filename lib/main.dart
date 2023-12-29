import 'package:flutter/material.dart';
import 'package:joinyou/ui/chat_room/chat_room.dart';
import 'package:joinyou/ui/find_team/find_team_page.dart';
import 'package:joinyou/ui/my_team/my_team_page.dart';
import 'package:joinyou/ui/rank_page/center_rank_page.dart';
import 'package:joinyou/ui/setting/setting_page.dart';
import 'app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Join You',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.grey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(setTitleText(_currentIndex))
      ),
      body: Column(
        children: [
          const Divider(),
          [
            FindTeam(),
            MyTeamPage(),
            RankPage(),
            ChatPage(),
            SettingPage()
          ][_currentIndex]
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.search),
                label: "搜尋球團"
            ),
            NavigationDestination(
                icon: ImageIcon(AssetImage("assets/badminton.png")),
                label: "我的球團"
            ),
            NavigationDestination(
                icon: Icon(Icons.circle_outlined),
                label: "Logo"
            ),
            NavigationDestination(
                icon: Icon(Icons.messenger_outline),
                label: "訊息"
            ),
            NavigationDestination(
                icon: Icon(Icons.person),
                label: "我的帳戶"
            )
          ],
          onDestinationSelected: (int i) {onTabTapped(i);}),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String setTitleText(int index) {
    switch (index) {
      case 0:
        return "搜尋球團";
      case 1:
        return "我的球團";
      case 2:
        return "Logo";
      case 3:
        return "訊息";
      case 4:
        return "我的帳戶";
      default:
        return "";
    }
  }
}
