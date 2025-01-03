import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:go_router/go_router.dart';

part 'router_builder.g.dart';

class RoutesNames {
  static const rootPath = '/';
  static const root = 'root';
  static const login = 'login';
  static const signup = 'signup';
  static const home = 'home';
  static const settings = 'settings';
  static const profile = 'profile';
}

@TypedGoRoute<LoginRoute>(
  name: RoutesNames.login,
  path: '${RoutesNames.rootPath}${RoutesNames.login}',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => sl<LoginScreen>();
}

@TypedGoRoute<RegisterRoute>(
  name: RoutesNames.signup,
  path: '${RoutesNames.rootPath}${RoutesNames.signup}',
)
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      sl<RegisterScreen>();
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => sl<HomeScreen>();
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      sl<ProfileScreen>();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      sl<SettingsScreen>();
}

@TypedStatefulShellRoute<RootShellRoute>(branches: [
  TypedStatefulShellBranch(routes: [
    TypedGoRoute<HomeRoute>(
      name: RoutesNames.home,
      path: '${RoutesNames.rootPath}${RoutesNames.home}',
    ),
  ]),
  TypedStatefulShellBranch(routes: [
    TypedGoRoute<ProfileRoute>(
      name: RoutesNames.profile,
      path: '${RoutesNames.rootPath}${RoutesNames.profile}',
    ),
  ]),
  TypedStatefulShellBranch(routes: [
    TypedGoRoute<SettingsRoute>(
      name: RoutesNames.settings,
      path: '${RoutesNames.rootPath}${RoutesNames.settings}',
    ),
  ])
])
class RootShellRoute extends StatefulShellRouteData {
  const RootShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return BottomNavigation(navigationShell: navigationShell);
  }
}
