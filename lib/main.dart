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
