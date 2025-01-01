import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class LogoutUC extends UseCaseWithoutParams<bool> {
  const LogoutUC(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<bool> call() => _repository.logout();
}
