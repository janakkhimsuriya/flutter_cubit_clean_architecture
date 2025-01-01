import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

abstract interface class AuthRepository {
  ResultFuture<bool> authenticated();

  ResultFuture<GenericResponse<UserProfile>> login(LoginParams params);

  ResultFuture<bool> logout();
}
