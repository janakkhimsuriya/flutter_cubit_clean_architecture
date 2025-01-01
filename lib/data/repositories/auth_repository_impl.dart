import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authDataSource);

  final AuthDataSource _authDataSource;

  @override
  ResultFuture<bool> authenticated() async {
    try {
      return Right(await _authDataSource.authenticated());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<GenericResponse<UserProfile>> login(LoginParams params) async {
    try {
      final result = await _authDataSource.login(params);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> logout() async {
    try {
      return Right(await _authDataSource.logout());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
