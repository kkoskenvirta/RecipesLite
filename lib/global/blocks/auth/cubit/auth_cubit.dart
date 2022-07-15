import 'package:bloc/bloc.dart';
import 'package:directus/directus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthState.authenticated()) {
    _init();
  }

  final AuthRepository _authRepository;

  _init() async {
    final isLoggedIn = await _authRepository.isUserLoggedIn();
    if (isLoggedIn) {
      emit(AuthState.authenticated());
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  login(String email, String password) async {
    emit(const AuthState.uninitialized(inProgress: true));

    final failureOrAuth =
        await _authRepository.loginSdk(email: email, password: password);
    failureOrAuth.fold(
      (error) =>
          emit(AuthState.uninitialized(inProgress: false, authError: error)),
      (auth) {
        emit(
          AuthState.authenticated(),
        );
      },
    );
  }

  logout() async {
    final failureOrLogout = await _authRepository.logoutSdk();
    failureOrLogout.fold(
      (error) =>
          emit(AuthState.uninitialized(inProgress: false, authError: error)),
      (auth) => emit(
        AuthState.unauthenticated(),
      ),
    );
  }

  updateState(AuthState newState) async => emit(newState);
}
