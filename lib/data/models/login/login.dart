import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    required String? email,
    required String? password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, Object?> json) =>
      _$LoginParamsFromJson(json);
}
