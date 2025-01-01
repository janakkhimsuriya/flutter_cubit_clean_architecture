import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_response.freezed.dart';
part 'generic_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class GenericResponse<T> with _$GenericResponse<T> {
  const factory GenericResponse({
    required int? status,
    required String? message,
    required T? data,
  }) = _GenericResponse;

  factory GenericResponse.fromJson(Map<String, dynamic> json,
      T Function(Object?) fromJsonT,) =>
      _$GenericResponseFromJson(json, fromJsonT);
}
