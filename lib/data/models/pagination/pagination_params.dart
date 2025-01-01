import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';
part 'pagination_params.g.dart';

@freezed
class PaginationParams with _$PaginationParams {
  const factory PaginationParams({
    @Default(1) int page,
    @Default(10) int pageSize,
  }) = _PaginationParams;

  factory PaginationParams.fromJson(Map<String, Object?> json) =>
      _$PaginationParamsFromJson(json);
}
