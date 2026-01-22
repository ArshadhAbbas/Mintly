import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/main.dart';
import 'package:mintly/view/bottom_nav/view/bottom_nav_view.dart';
import 'package:mintly/view/onboarding/view/onboarding_view.dart';

class GoRouterConfig {
  static final GoRouter _router = GoRouter(
    initialLocation: prefs?.getBool("didShow") != null && prefs!.getBool("didShow")! ? BottomNavView.path : OnBoardingView.path,
    routes: [
      GoRouterRoute(pathRoute: OnBoardingView.path, pathRouteName: OnBoardingView.pathName, builder: (context, state) => OnBoardingView()),
      GoRouterRoute(pathRoute: BottomNavView.path, pathRouteName: BottomNavView.pathName, builder: (context, state) => BottomNavView()),
    ],
    errorBuilder: (context, state) => Scaffold(body: Center(child: Text(state.error.toString()))),
  );

  static GoRouter get router => _router;
}

class GoRouterRoute extends GoRoute {
  GoRouterRoute({
    String? pathRouteName,
    super.routes,
    super.redirect,
    required String pathRoute,
    required Widget Function(BuildContext context, GoRouterState state) builder,
  }) : super(name: pathRouteName, path: pathRoute, builder: (context, state) => builder(context, state));
}
