import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUc, this._logoutUc)
      : super(const AuthState.authInitial());

  final LoginUC _loginUc;
  final LogoutUC _logoutUc;

  Future<void> init() async {
    (await _loginUc.authenticated()).fold(
      (failure) => emit(AuthState.unauthenticated(message: failure.message)),
      (response) => response
          ? emit(const AuthState.authenticated())
          : emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> login(String username, String password) async {
    emit(const AuthState.authLoading());

    Future.delayed(const Duration(seconds: 3), () {
      emit(const AuthState.authenticated());
    });

    /*final result = await _loginUc(
      LoginParams(email: username, password: password),
    );

    result.fold(
      (failure) => emit(
        AuthState.unauthenticated(message: failure.errorMessage),
      ),
      (response) => emit(const AuthState.authenticated()),
    );*/
  }

  Future<void> logout() async {
    (await _logoutUc()).fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (response) => emit(const AuthState.unauthenticated()),
    );
  }
}
