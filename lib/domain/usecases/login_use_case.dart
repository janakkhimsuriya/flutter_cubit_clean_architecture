import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class LoginUC
    extends UseCaseWithParams<GenericResponse<UserProfile>, LoginParams> {
  const LoginUC(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<GenericResponse<UserProfile>> call(LoginParams params) =>
      _repository.login(params);

  ResultFuture<bool> authenticated() => _repository.authenticated();
}
