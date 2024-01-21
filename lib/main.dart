import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/ui/chat_room/chat_room.dart';
import 'package:joinyou/ui/find_team/find_team_page.dart';
import 'package:joinyou/ui/my_team/my_team_page.dart';
import 'package:joinyou/ui/rank_page/center_rank_page.dart';
import 'package:joinyou/ui/setting/setting_page.dart';
import 'NavigationHelper.dart';
import 'app_color.dart';

void main() {
  NavigationHelper.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: NavigationHelper.router,
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
      appBar: AppBar(title: Text(setTitleText(_currentIndex))),
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
            NavigationDestination(icon: Icon(Icons.search), label: "搜尋球團"),
            NavigationDestination(
                icon: ImageIcon(AssetImage("assets/badminton.png")),
                label: "我的球團"),
            NavigationDestination(
                icon: Icon(Icons.circle_outlined), label: "Logo"),
            NavigationDestination(
                icon: Icon(Icons.messenger_outline), label: "訊息"),
            NavigationDestination(icon: Icon(Icons.person), label: "我的帳戶")
          ],
          onDestinationSelected: (int i) {
            onTabTapped(i);
          }),
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

class MainPageWithNavBar extends StatefulWidget {
  String location;
  final Widget child;

  MainPageWithNavBar({super.key, required this.child, required this.location});

  @override
  State<MainPageWithNavBar> createState() => _MainPageWithNavBar();
}

class _MainPageWithNavBar extends State<MainPageWithNavBar> {
  int _currentIndex = 0;

  static List<MainBottomNavBarItem> mainBottomNavBarItems = [
    MainBottomNavBarItem(
        icon: Icon(Icons.search), label: "搜尋球團", initialLocation: "/"),
    MainBottomNavBarItem(
        icon: ImageIcon(AssetImage("assets/badminton.png")),
        label: "我的球團",
        initialLocation: "/my_team"),
    MainBottomNavBarItem(
        icon: Icon(Icons.circle_outlined),
        label: "Logo",
        initialLocation: "/rank"),
    MainBottomNavBarItem(
        icon: Icon(Icons.messenger_outline),
        label: "訊息",
        initialLocation: "/chat"),
    MainBottomNavBarItem(
        icon: Icon(Icons.person), label: "我的帳戶", initialLocation: "/setting")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Text(setTitleText(_currentIndex))
      ),
      body: Expanded(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.title_green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: mainBottomNavBarItems,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
            String location = mainBottomNavBarItems[i].initialLocation;
            GoRouter.of(context).go(location);
          });
        },
      ),
    );
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

class MainBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  MainBottomNavBarItem(
      {required super.icon,
      required super.label,
      required this.initialLocation});
}
