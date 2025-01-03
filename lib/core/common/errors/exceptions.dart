import 'package:equatable/equatable.dart';

class ApiException extends Equatable implements Exception {
  const ApiException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  List<dynamic> get props => [message, statusCode];
}

class CacheException extends Equatable implements Exception {
  const CacheException({required this.message, this.statusCode = 500});

  final String message;
  final int statusCode;

  @override
  List<dynamic> get props => [message, statusCode];
}

class NetworkException extends Equatable implements Exception {
  const NetworkException({required this.message, this.statusCode = 503});

  final String message;
  final int statusCode;

  @override
  List<dynamic> get props => [message, statusCode];
}
