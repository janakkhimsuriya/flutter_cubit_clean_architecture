import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

// ignore: one_member_abstracts
abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

// ignore: one_member_abstracts
abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}
