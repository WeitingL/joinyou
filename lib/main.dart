import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        icon: Icon(Icons.search),
        label: "搜尋球團",
        initialLocation: NavigationHelper.HOME_PAGE),
    MainBottomNavBarItem(
        icon: ImageIcon(AssetImage("assets/badminton.png")),
        label: "我的球團",
        initialLocation: NavigationHelper.MY_TEAM_PAGE),
    MainBottomNavBarItem(
        icon: Icon(Icons.circle_outlined),
        label: "積分排名",
        initialLocation: NavigationHelper.RANK_PAGE),
    MainBottomNavBarItem(
        icon: Icon(Icons.messenger_outline),
        label: "訊息",
        initialLocation: NavigationHelper.CHAT_PAGE),
    MainBottomNavBarItem(
        icon: Icon(Icons.person),
        label: "我的帳戶",
        initialLocation: NavigationHelper.SETTING_PAGE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text(setTitleText(_currentIndex)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // 設置 Divider 的高度
          child: Container(
            color: Colors.grey, // Divider 的顏色
            height: 1.0,
          ),
        ),
      ),
      body: widget.child,
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
        return "積分排名";
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
