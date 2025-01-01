import 'dart:async';

import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:logging/logging.dart';

abstract interface class AuthDataSource {
  Future<bool> authenticated();

  Future<GenericResponse<UserProfile>> login(LoginParams params);

  Future<bool> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl(
    this._networkInfo,
    this._retrofitService,
    this._preference,
  );

  final NetworkInfo _networkInfo;
  final RetrofitService _retrofitService;
  final PreferenceManager _preference;

  final _log = Logger('AuthDataSourceImpl');

  @override
  Future<bool> authenticated() async {
    try {
      return await _preference.isAuthenticated();
    } catch (error, st) {
      _log.severe('logout', error, st);
      throw CacheException(message: error.toString());
    }
  }

  @override
  Future<GenericResponse<UserProfile>> login(LoginParams params) async {
    try {
      final response = await request<UserProfile>(_networkInfo, () {
        return _retrofitService.login(params);
      });

      unawaited(_preference.setUserProfile(response.data!));

      return response;
    } on ApiException {
      rethrow;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await _preference.clearUser();
      return true;
    } catch (error, st) {
      _log.severe('logout', error, st);
      throw CacheException(message: error.toString());
    }
  }
}
