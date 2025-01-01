import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging/logging.dart';

class App extends StatelessWidget {
  App({super.key});

  final _logger = Logger('App');

  @override
  Widget build(BuildContext context) {
    _logger.fine('build: flavour: $env');

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => sl<LocaleCubit>()..init(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => sl<AuthCubit>()..init(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => sl<HomeCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          final locale = state.maybeWhen(
            changed: (locale) => locale,
            orElse: () => AppLocalization.localeEn,
          );

          return ScreenUtilInit(
            designSize: iPhone16ProMaxVp,
            minTextAdapt: true,
            child: MaterialApp.router(
              theme: getAppTheme(context),
              darkTheme: getAppTheme(context),
              scrollBehavior: const MaterialScrollBehavior().copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                },
              ),
              debugShowCheckedModeBanner: false,
              onGenerateTitle: (context) => context.strings.appName,
              locale: locale,
              localizationsDelegates: AppLocalization.delegates,
              supportedLocales: AppLocalization.supportedLocales,
              routerConfig: AppRouter.router,
            ),
          );
        },
      ), // Replace with your desired widget
    );
  }
}
