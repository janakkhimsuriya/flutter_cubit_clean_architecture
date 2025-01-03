import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final router = GoRouter(
    initialLocation: '${RoutesNames.rootPath}${RoutesNames.login}',
    routes: $appRoutes,
    refreshListenable: RouterRefreshStream(sl<AuthCubit>().stream),
    redirect: (context, state) {
      final authState = sl<AuthCubit>().state;

      final protectedRoutes = [const HomeRoute().location];

      if (authState is Unauthenticated) {
        if (protectedRoutes.contains(state.matchedLocation)) {
          return const LoginRoute().location;
        }
        return null;
      }

      if (authState is Authenticated &&
          (state.matchedLocation.contains(const LoginRoute().location) ||
              state.matchedLocation.contains(const RegisterRoute().location))) {
        return const HomeRoute().location;
      }

      return null;
    },
  );
}
