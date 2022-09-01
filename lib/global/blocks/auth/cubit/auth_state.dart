part of 'auth_cubit.dart';

enum AuthStateStatus { uninitialized, authenticated, unauthenticated }

enum RegisterStatus { uninitialized, loading, completed, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStateStatus status,
    required RegisterStatus registerStatus,
    required AuthError? error,
    required AuthError? registerError,
    required bool inProgress,
  }) = _AuthState;

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStateStatus.uninitialized,
      registerStatus: RegisterStatus.uninitialized,
      error: null,
      registerError: null,
      inProgress: false,
    );
  }
}
