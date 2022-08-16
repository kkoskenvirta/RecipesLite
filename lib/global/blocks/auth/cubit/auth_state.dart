part of 'auth_cubit.dart';

enum AuthStateStatus { uninitialized, authenticated, unauthenticated }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStateStatus status,
    required AuthError? error,
    required AuthError? registerError,
    required bool inProgress,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStateStatus.uninitialized,
      error: null,
      registerError: null,
      inProgress: false,
    );
  }
}
