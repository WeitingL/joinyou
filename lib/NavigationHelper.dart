import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/ui/chat_room/chat_room.dart';
import 'package:joinyou/ui/find_team/find_team_page.dart';
import 'package:joinyou/ui/my_team/my_team_page.dart';
import 'package:joinyou/ui/rank_page/center_rank_page.dart';
import 'package:joinyou/ui/setting/setting_page.dart';

import 'main.dart';

// create a class is an global instance
class NavigationHelper {

  static final NavigationHelper _instance =
  NavigationHelper._internal();

  static NavigationHelper get instance => _instance;

  static late final GoRouter router;

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _homeNavigatorKey = GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  factory NavigationHelper() {
    return _instance;
  }

  NavigationHelper._internal() {
    final routes = [
        ShellRoute(
            navigatorKey: _homeNavigatorKey,
            pageBuilder: (context, state, child) =>
                NoTransitionPage(child: MainPageWithNavBar(
                  child: child,
                  location: state.matchedLocation,
                )),
            routes: [
              GoRoute(
                path: '/',
                parentNavigatorKey: _homeNavigatorKey,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: FindTeam()),
              ),
              GoRoute(
                path: '/my_team',
                parentNavigatorKey: _homeNavigatorKey,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MyTeamPage()),
              ),
              GoRoute(
                path: '/rank',
                parentNavigatorKey: _homeNavigatorKey,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: RankPage()),
              ),
              GoRoute(
                path: '/chat',
                parentNavigatorKey: _homeNavigatorKey,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: ChatPage()),
              ),
              GoRoute(
                path: '/setting',
                parentNavigatorKey: _homeNavigatorKey,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: SettingPage()),
              ),
            ])
      ];

    router = GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      routes: routes,
    );
  }
}
