import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explicity_json_sample.freezed.dart';

part 'explicity_json_sample.g.dart';

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    required String? id,
    required UserProfile data,
  }) = _ProfileData;

  const ProfileData._();

  factory ProfileData.fromJson(Map<String, Object?> json) =>
      _$ProfileDataFromJson(json);
}
