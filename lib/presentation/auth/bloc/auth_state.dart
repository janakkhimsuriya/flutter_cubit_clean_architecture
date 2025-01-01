part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authInitial() = AuthInitial;

  const factory AuthState.authLoading() = AuthLoading;

  const factory AuthState.authenticated() = Authenticated;

  const factory AuthState.unauthenticated({String? message}) = Unauthenticated;

  const factory AuthState.registrationSuccess() = RegistrationSuccess;

  const factory AuthState.registrationFailed(String message) =
  RegistrationFailed;
}
