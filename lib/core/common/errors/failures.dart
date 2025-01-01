import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

abstract class Failure extends Equatable {
  Failure({required this.message, required this.statusCode})
      : assert(
          statusCode is String || statusCode is int,
          'StatusCode cannot be a ${statusCode.runtimeType}',
        );

  final String message;
  final dynamic statusCode;

  String get errorMessage => '$statusCode $message';

  @override
  List<dynamic> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, required super.statusCode});

  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class ApiFailure extends Failure {
  ApiFailure({required super.message, required super.statusCode});

  ApiFailure.fromException(ApiException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message, required super.statusCode});

  NetworkFailure.fromException(NetworkException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
