import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kksc_app_fe/Screen/Honeytip/Honeytip.dart';
import 'package:kksc_app_fe/Screen/Honeytip/HoneytipDetail.dart';
import 'package:kksc_app_fe/Screen/Mainpage/Mainpage.dart';
import 'package:kksc_app_fe/Screen/Mypage/Mypage.dart';
import 'package:kksc_app_fe/Screen/Mypage/Signuppage/Signuppage.dart';
import 'package:kksc_app_fe/Screen/Notice/Notice.dart';
import 'package:kksc_app_fe/Screen/Restaurant/Restaurant.dart';
import 'package:kksc_app_fe/Screen/Restaurant/RestaurantListIn.dart';
import 'package:kksc_app_fe/Screen/Timetable/Timetable.dart';
import 'package:kksc_app_fe/Screen/main_navigation_bar.dart';
import 'package:kksc_app_fe/util/cosnt_value.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorMainKey =
    GlobalKey<NavigatorState>(debugLabel: routeMainPage);
final _shellNavigatorRestaurantKey =
    GlobalKey<NavigatorState>(debugLabel: routeRestaurantPage);
final _shellNavigatorHoneyTipKey =
    GlobalKey<NavigatorState>(debugLabel: routeHoneyTipPage);
final _shellNavigatorNoticeKey =
    GlobalKey<NavigatorState>(debugLabel: routeNoticePage);
final _shellNavigatorTimeTableKey =
    GlobalKey<NavigatorState>(debugLabel: routeTimeTablePage);

String pageNameSearch(String pagePath) => pagePath.substring(1);

final mainRouter = GoRouter(
  initialLocation: routeMainPage,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: routeLoginPage,
      builder: (context, state) => Signuppage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainNavigationBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMainKey,
          routes: [
            GoRoute(
                path: routeMainPage,
                builder: (context, state) => MainpageScreen(),
                routes: [
                  GoRoute(
                    path: routeMyPage,
                    builder: (context, state) => MyPageScreen(),
                  ),
                ],),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorTimeTableKey,
          routes: [
            GoRoute(
              path: routeTimeTablePage,
              builder: (context, state) => TimetableScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNoticeKey,
          routes: [
            GoRoute(
              path: routeNoticePage,
              builder: (context, state) => NoticeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRestaurantKey,
          routes: [
            GoRoute(
              path: routeRestaurantPage,
              builder: (context, state) => RestaurantScreen(),
              routes: [
                GoRoute(
                  path: routeRestaurantViewDetailPage,
                  builder: (context, state) => RestaurantListInScreen(),
                ),
                GoRoute(
                  path: routeRestaurantWritePage,
                  builder: (context, state) => RestaurantScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHoneyTipKey,
          routes: [
            GoRoute(
              path: routeHoneyTipPage,
              builder: (context, state) => HoneytipScreen(),
              routes: [
                GoRoute(
                  path: routeHoneyTipPageViewDetailPage,
                  builder: (context, state) => HoneytipScreen(),
                ),
                GoRoute(
                  path: "$routeHoneyTipPageWritePage/:title/:subtitle",
                  name: pageNameSearch(routeHoneyTipPageWritePage),
                  builder: (context, state) => HoneytipDetail(title: state.pathParameters["title"]!, subtitle: state.pathParameters["subtitle"]!),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
