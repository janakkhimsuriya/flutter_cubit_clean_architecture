import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;

typedef OnSearch = void Function(String searchQuery);
