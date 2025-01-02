import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

part 'app_router.freezed.dart';

@freezed
class AppRouteName with _$AppRouteName {
  const AppRouteName._();

  const factory AppRouteName.root() = _Root;

  const factory AppRouteName.login() = _Login;

  const factory AppRouteName.signup() = _Signup;

  const factory AppRouteName.home() = _Home;

  static const rootPath = '/';

  String get name => map(
        root: (_) => 'root',
        login: (_) => 'login',
        signup: (_) => 'signup',
        home: (_) => 'home',
      );

  String get path => map(
        root: (_) => rootPath,
        login: (_) => '$rootPath$name',
        signup: (_) => '$rootPath$name',
        home: (_) => '$rootPath$name',
      );
}

class AppRouter {
  static final _logger = Logger('AppRouter');

  static final router = GoRouter(
    initialLocation: const AppRouteName.login().path,
    routes: [
      _route(const AppRouteName.login(), sl.call<LoginScreen>),
      _route(const AppRouteName.signup(), sl.call<RegisterScreen>),
      _route(const AppRouteName.home(), sl.call<HomeScreen>),
    ],
    refreshListenable: GoRouterRefreshStream(sl<AuthCubit>().stream),
    redirect: (context, state) {
      final authState = sl<AuthCubit>().state;

      final protectedRoutes = [const AppRouteName.home().path];

      if (authState is Unauthenticated) {
        if (protectedRoutes.contains(state.matchedLocation)) {
          return const AppRouteName.login().path;
        }
        return null;
      }

      if (authState is Authenticated &&
          (state.matchedLocation.contains(const AppRouteName.login().path) ||
              state.matchedLocation
                  .contains(const AppRouteName.signup().path))) {
        return const AppRouteName.home().path;
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
