import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._authDataSource);

  final ProfileDataSource _authDataSource;

  @override
  ResultFuture<UserProfile> getLocalProfile() async {
    try {
      return Right(await _authDataSource.getLocalProfile());
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
