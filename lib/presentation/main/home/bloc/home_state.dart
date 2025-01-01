part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeInitial;

  const factory HomeState.loading() = _HomeLoading;

  const factory HomeState.success() = _HomeSuccess;

  const factory HomeState.failed() = _HomeFailed;
}
