import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tinkercad/features/common/navigation/navigation_container.dart';
import 'package:tinkercad/services/navigation/activity_route.dart';
import 'package:tinkercad/services/navigation/monitor_route.dart';
import 'package:tinkercad/services/navigation/settings_route.dart';

final appRouterProvider = Provider((ref) => AppRouter());

final _rootNavigatorKey = GlobalKey<NavigatorState>();

//todo navigation observers does not work
class AppRouter {
  final GoRouter delegate;

  AppRouter()
      : delegate = GoRouter(
          navigatorKey: _rootNavigatorKey,
          initialLocation: '/activity',
          routes: <RouteBase>[
            ...topRoutes,
            StatefulShellRoute.indexedStack(
              branches: <StatefulShellBranch>[
                ActivityRoute(),
                MonitorRoute(),
                SettingsRoute(),
              ],
              builder: (context, state, navigationShell) => NavigationContainer(
                navigationShell: navigationShell,
              ),
            ),
          ],
        );

  static final topRoutes = <GoRoute>[];

  void pop<T>() => delegate.pop();

  void push(String location) => delegate.push(location);

  void go(String location) => delegate.go(location);

  void replace(String location) => delegate.pushReplacement(location);
}
