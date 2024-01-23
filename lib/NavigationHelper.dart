import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:joinyou/ui/chat_room/chat_room.dart';
import 'package:joinyou/ui/create_team_pages/create_normal_team.dart';
import 'package:joinyou/ui/create_team_pages/create_team.dart';
import 'package:joinyou/ui/create_team_pages/set_team_location.dart';
import 'package:joinyou/ui/find_team/find_team_map.dart';
import 'package:joinyou/ui/find_team/find_team_page.dart';
import 'package:joinyou/ui/my_team/my_team_page.dart';
import 'package:joinyou/ui/rank_page/center_rank_page.dart';
import 'package:joinyou/ui/setting/setting_page.dart';
import 'package:joinyou/ui/team_operation/master/add_new_gamer.dart';
import 'package:joinyou/ui/team_operation/master/manage_game.dart';
import 'package:joinyou/ui/team_operation/master/real_time_game.dart';
import 'package:joinyou/ui/team_operation/master/start_arrange.dart';
import 'package:joinyou/ui/team_operation/member/already_to_go_page.dart';
import 'package:joinyou/ui/team_operation/member/challenge_page.dart';
import 'package:joinyou/ui/team_operation/member/team_mamber_page.dart';
import 'package:joinyou/ui/team_operation/member/team_match_page.dart';
import 'package:joinyou/ui/team_operation/team_operation_page.dart';

import 'data/data_team.dart';
import 'data/team_data_type.dart';
import 'main.dart';

// create a class is an global instance
class NavigationHelper {
  static final NavigationHelper _instance = NavigationHelper._internal();

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

  static const HOME_PAGE = "/";
  static const MY_TEAM_PAGE = "/my_team";
  static const RANK_PAGE = "/rank";
  static const CHAT_PAGE = "/chat";
  static const SETTING_PAGE = "/setting";

  static const TEAM_OPT_PAGE = "/team_operation";
  static const TEAM_FIND_MAP_PAGE = "/map_find_team";

  static const CREATE_TEAM_PAGE = "/create_team/normal_team";
  static const CREATE_TEAM_LOCATION_PAGE = "/create_team/normal_team/location";

  static const FAST_CREATE_TEAM_PAGE = "/create_team/fast_team";

  static const PRE_GAME_PAGE = "/master/pre_game";
  static const REAL_TIME_PAGE = "/master/real_time_game";
  static const MANAGE_GAME_PAGE = "/master/manage_game";
  static const ADD_NEW_GAMER_PAGE = "/master/add_new_gamer";

  static const READY_TO_GO_PAGE = "/member/already_to_go";
  static const CHALLENG_PAGE = "/member/challenge_page";
  static const MATCH_TEAM_PAGE = "/member/match_team";
  static const MEMBER_LIST_PAGE = "/member/member_list";


  NavigationHelper._internal() {
    final routes = <RouteBase>[
      ShellRoute(
          navigatorKey: _homeNavigatorKey,
          pageBuilder: (context, state, child) => NoTransitionPage(
                  child: MainPageWithNavBar(
                child: child,
                location: state.matchedLocation,
              )),
          routes: [
            GoRoute(
              path: HOME_PAGE,
              parentNavigatorKey: _homeNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: FindTeam()),
            ),
            GoRoute(
              path: MY_TEAM_PAGE,
              parentNavigatorKey: _homeNavigatorKey,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: MyTeamPage()),
            ),
            GoRoute(
              path: RANK_PAGE,
              parentNavigatorKey: _homeNavigatorKey,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: RankPage()),
            ),
            GoRoute(
              path: CHAT_PAGE,
              parentNavigatorKey: _homeNavigatorKey,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: ChatPage()),
            ),
            GoRoute(
              path: SETTING_PAGE,
              parentNavigatorKey: _homeNavigatorKey,
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: SettingPage()),
            ),
          ]),
      GoRoute(
        path: TEAM_OPT_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: BlocProvider(
              create: (context) => TeamOperationCubit(
                teamData: extra?["teamData"] as TeamData,
                infoType: extra?["infoType"] as InfoType,
              ),
              child: TeamOperationPage(),
            ),
          );
        },
      ),
      GoRoute(
        path: TEAM_FIND_MAP_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: FindTeamByMap(),
          );
        },
      ),

      GoRoute(
        path: CREATE_TEAM_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: CreateNormalTeam(),
          );
        },
      ),

      GoRoute(
        path: FAST_CREATE_TEAM_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: CreateTeamPage(),
          );
        },
      ),

      GoRoute(
        path: CREATE_TEAM_LOCATION_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: SettingTeamLocation(),
          );
        },
      ),

      GoRoute(
        path: PRE_GAME_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: StartArrangePage(),
          );
        },
      ),

      GoRoute(
        path: REAL_TIME_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: RealTimeGame(),
          );
        },
      ),

      GoRoute(
        path: MANAGE_GAME_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: ManageGame(),
          );
        },
      ),

      GoRoute(
        path: ADD_NEW_GAMER_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: AddNewGamePlayer(),
          );
        },
      ),

      GoRoute(
        path: READY_TO_GO_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: AlreadyToGo(),
          );
        },
      ),

      GoRoute(
        path: CHALLENG_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: ChallengePage(),
          );
        },
      ),

      GoRoute(
        path: MATCH_TEAM_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: TeamMatchPage(),
          );
        },
      ),

      GoRoute(
        path: MEMBER_LIST_PAGE,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return NoTransitionPage(
            child: TeamMemberListPage(),
          );
        },
      ),









    ];

    router = GoRouter(
      initialLocation: '/',
      navigatorKey: _rootNavigatorKey,
      routes: routes,
    );
  }
}
