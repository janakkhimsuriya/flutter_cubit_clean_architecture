import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

enum AppRouteName { root, login, signup, home }

extension AppRouteNameExt on AppRouteName {
  String get path {
    switch (this) {
      case AppRouteName.root:
        return '/';
      case AppRouteName.login:
        return '/login';
      case AppRouteName.signup:
        return '/signup';
      case AppRouteName.home:
        return '/home';
    }
  }
}

class AppRouter {
  static final _logger = Logger('AppRouter');

  static final router = GoRouter(
    initialLocation: AppRouteName.login.path,
    routes: [
      _route(AppRouteName.login, sl.call<LoginScreen>),
      _route(AppRouteName.signup, sl.call<RegisterScreen>),
      _route(AppRouteName.home, sl.call<HomeScreen>),
    ],
    refreshListenable: GoRouterRefreshStream(sl<AuthCubit>().stream),
    redirect: (context, state) {
      final authState = sl<AuthCubit>().state;

      final protectedRoutes = [AppRouteName.home.path];

      if (authState is Unauthenticated) {
        if (protectedRoutes.contains(state.matchedLocation)) {
          return AppRouteName.login.path;
        }
        return null;
      }

      if (authState is Authenticated &&
          (state.matchedLocation.contains(AppRouteName.login.path) ||
              state.matchedLocation.contains(AppRouteName.signup.path))) {
        return AppRouteName.home.path;
      }

      return null;
    },
  );

  static GoRoute _route(AppRouteName routeName, Widget Function() builder) {
    return GoRoute(
      name: routeName.name,
      path: routeName.path,
      builder: (context, state) {
        _logger.fine('route: ${state.name}');
        return builder();
      },
    );
  }
}
