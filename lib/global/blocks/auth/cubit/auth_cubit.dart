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

  logout() async {
    try {
      final refreshToken = await _secureStorageRepository.getWithKey(StorageKeys.refreshToken);
      await _secureStorageRepository.removeWithKey(StorageKeys.refreshToken);

      emit(state.copyWith(status: AuthStateStatus.unauthenticated));
      _authRepository.logout(refreshToken: refreshToken.toString());
    } catch (e) {
      print("error when logging out");
    }
  }

  register(String username, String email, String password) async {
    emit(state.copyWith(inProgress: true));

    final failureOrUser = await _authRepository.register(username: username, email: email, password: password);
    failureOrUser.fold(
        (error) =>
            emit(state.copyWith(inProgress: false, status: AuthStateStatus.unauthenticated, registerError: error)),
        (user) => login(email, password));
  }

  updateState(AuthStateStatus newState, bool inProgress) async =>
      emit(state.copyWith(status: newState, inProgress: inProgress));
}
