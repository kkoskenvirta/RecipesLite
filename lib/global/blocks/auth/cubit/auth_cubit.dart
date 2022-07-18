import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required AuthRepository authRepository, required SecureStorageRepository secureStorageRepository})
      : _authRepository = authRepository,
        _secureStorageRepository = secureStorageRepository,
        super(AuthState.authenticated()) {
    _init();
  }

  final AuthRepository _authRepository;
  final SecureStorageRepository _secureStorageRepository;

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

    final failureOrAuth = await _authRepository.login(email: email, password: password);
    failureOrAuth.fold(
      (error) => emit(AuthState.uninitialized(inProgress: false, authError: error)),
      (auth) {
        _secureStorageRepository.setWithKey(StorageKeys.accessToken, auth.accessToken);
        _secureStorageRepository.setWithKey(StorageKeys.refreshToken, auth.refreshToken);

        emit(
          AuthState.authenticated(),
        );
      },
    );
  }

  logout() async {
    try {
      final refreshToken = await _secureStorageRepository.getWithKey(StorageKeys.refreshToken);
      await _secureStorageRepository.removeWithKey(StorageKeys.refreshToken);

      emit(const AuthState.unauthenticated());
      _authRepository.logout(refreshToken: refreshToken.toString());
    } catch (e) {
      print("error when logging out");
    }
  }

  updateState(AuthState newState) async => emit(newState);
}
