import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthRepository authRepository, required SecureStorageRepository secureStorageRepository})
      : _authRepository = authRepository,
        _secureStorageRepository = secureStorageRepository,
        super(AuthState.initial()) {
    _init();
  }

  final AuthRepository _authRepository;
  final SecureStorageRepository _secureStorageRepository;

  _init() async {
    final isLoggedIn = await _authRepository.isUserLoggedIn();
    if (isLoggedIn) {
      emit(state.copyWith(status: AuthStateStatus.authenticated));
    } else {
      emit(state.copyWith(status: AuthStateStatus.unauthenticated));
    }
  }

  login(String email, String password) async {
    emit(state.copyWith(status: AuthStateStatus.uninitialized, inProgress: true));
    final failureOrAuth = await _authRepository.login(email: email, password: password);
    failureOrAuth.fold(
      (error) => emit(state.copyWith(
        inProgress: false,
        status: AuthStateStatus.unauthenticated,
        error: error,
      )),
      (auth) {
        _secureStorageRepository.setWithKey(StorageKeys.accessToken, auth.accessToken);
        _secureStorageRepository.setWithKey(StorageKeys.refreshToken, auth.refreshToken);

        emit(state.copyWith(status: AuthStateStatus.authenticated));
      },
    );
  }

  loginWithGoogle() async {
    try {
      final result = await FlutterWebAuth.authenticate(
          url:
              "https://directus-em2ehfwczq-ew.a.run.app/auth/login/google?prompt=consent&redirect=https://directus-em2ehfwczq-ew.a.run.app/redirect-with-token?redirect=recipeslite://login-callback?refresh_token=",
          callbackUrlScheme: "recipeslite");

      final refreshToken = Uri.parse(result).queryParameters['refresh_token'];
      print('response: $refreshToken');
      if (refreshToken != null) {
        loginWithProvider(refreshToken);
      }
    } catch (e) {
      return;
    }
  }

  loginWithProvider(String token) async {
    emit(state.copyWith(status: AuthStateStatus.uninitialized, inProgress: true));

    final failureOrAuth = await _authRepository.refreshAccessToken(refreshToken: token);
    failureOrAuth.fold(
      (error) => emit(state.copyWith(
        inProgress: false,
        status: AuthStateStatus.unauthenticated,
        error: error,
      )),
      (_) => emit(
        state.copyWith(
          inProgress: false,
          status: AuthStateStatus.authenticated,
        ),
      ),
    );
  }

  logout() async {
    try {
      final refreshToken = await _secureStorageRepository.getWithKey(StorageKeys.refreshToken);
      await _secureStorageRepository.removeWithKey(StorageKeys.refreshToken);

      emit(state.copyWith(status: AuthStateStatus.unauthenticated));
      _authRepository.logout(refreshToken: refreshToken.toString());
    } catch (e) {
      if (kDebugMode) {
        print("error when logging out");
      }
    }
  }

  register(String username, String email, String password, BuildContext context) async {
    try {
      emit(state.copyWith(inProgress: true, registerStatus: RegisterStatus.loading));
      final failureOrUser = await _authRepository.register(username: username, email: email, password: password);
      failureOrUser.fold(
        (error) {
          emit(state.copyWith(inProgress: false, registerStatus: RegisterStatus.error, registerError: error));
        },
        (user) {
          emit(state.copyWith(inProgress: false, registerStatus: RegisterStatus.completed));
        },
      );
    } catch (e) {
      return RegisterStatus.error;
    }
  }

  Future<void> delete(String id) async {
    final errorOrUserDeleted = await _authRepository.deleteAccount(accountId: id);
    errorOrUserDeleted.fold((err) => print(err), (_) {
      logout();
    });
  }

  updateState(AuthStateStatus newState, bool inProgress) async =>
      emit(state.copyWith(status: newState, inProgress: inProgress));
}
