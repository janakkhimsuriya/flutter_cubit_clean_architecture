import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

void di() {
  sl.allowReassignment = true;
  _diCore();
  _diDataSource();
  _diRepositories();
  _diUseCases();
  _diPresentations();
}

final _logger = Logger('FlutterBlocArchitectureApp');

void _diCore() {
  sl
    ..registerLazySingleton<NetworkInfo>(NetworkInfoImpl.new)
    ..registerLazySingleton<Dio>(() {
      final timeout = ekEnv == Flavour.dev.value ? 60 : 120;
      final dio = Dio(BaseOptions(
        connectTimeout: Duration(seconds: timeout),
        receiveTimeout: Duration(seconds: timeout),
        sendTimeout: Duration(seconds: timeout),
      ));

      dio.interceptors.addAll([
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (Object object) {
            _logger.fine('$object');
          },
        ),
      ]);
      return dio;
    })
    ..registerLazySingleton<RetrofitService>(() {
      return RetrofitService(sl(), baseUrl: baseUrl);
    })
    ..registerLazySingleton(SharedPreferencesAsync.new)
    ..registerLazySingleton(() => PreferenceManager(sl()))
    ..registerLazySingleton(() => AppLocalization(sl()))
    ..registerLazySingleton(English.new)
    ..registerLazySingleton(Spanish.new)
    ..registerLazySingleton(LocaleCubit.new);
}

void _diDataSource() {
  sl
    ..registerLazySingleton<AuthDataSource>(() {
      return AuthDataSourceImpl(sl(), sl(), sl());
    })
    ..registerLazySingleton<ProfileDataSource>(() {
      return ProfileDataSourceImpl(sl());
    });
}

void _diRepositories() {
  sl
    ..registerLazySingleton<AuthRepository>(() {
      return AuthRepositoryImpl(sl());
    })
    ..registerLazySingleton<ProfileRepository>(() {
      return ProfileRepositoryImpl(sl());
    });
}

void _diUseCases() {
  sl
    ..registerLazySingleton(() => GetLocalProfileUC(sl()))
    ..registerLazySingleton(() => LoginUC(sl()))
    ..registerLazySingleton(() => LogoutUC(sl()));
}

void _diPresentations() {
  sl
    ..registerLazySingleton(() => AuthCubit(sl(), sl()))
    ..registerLazySingleton(LoginScreen.new)
    ..registerLazySingleton(RegisterScreen.new)
    ..registerLazySingleton(HomeCubit.new)
    ..registerLazySingleton(HomeScreen.new);
}
