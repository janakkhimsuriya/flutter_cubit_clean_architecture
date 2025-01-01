import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class GetLocalProfileUC extends UseCaseWithoutParams<UserProfile> {
  const GetLocalProfileUC(this._repository);

  final ProfileRepository _repository;

  @override
  ResultFuture<UserProfile> call() => _repository.getLocalProfile();
}
