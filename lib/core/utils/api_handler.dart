import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:retrofit/dio.dart';

Future<GenericResponse<T>> request<T>(
  NetworkInfo networkInfo,
  Future<HttpResponse<GenericResponse<T>>> Function() call,
) async {
  if (await networkInfo.isConnected()) {
    try {
      final response = await call();
      if (response.response.statusCode == 200) {
        return response.data;
      }

      throw ApiException(
        message: response.data.message ?? '',
        statusCode: response.data.status ?? 501,
      );
    } on ApiException {
      rethrow;
    } catch (error) {
      throw const ApiException(message: 'Network error', statusCode: 501);
    }
  } else {
    throw const NetworkException(message: 'No internet connection');
  }
}
