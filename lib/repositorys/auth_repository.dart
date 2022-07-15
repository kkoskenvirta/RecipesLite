import 'package:dio/dio.dart';
import 'package:directus/directus.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/auth/auth_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import '../models/auth/dto/auth_dto.dart';
import '../modules/dio_module.dart';

enum AuthError { userNotExist, invalidCredentials, userAlreadyExist, invalidPayload, roleNoteFound, unexpected }
// await DirectusSingleton.init('http://localhost:8055')
// final sdk = DirectusSingleton.instance;

class AuthRepository {
  AuthRepository({
    required DioModule dioModule,
    required DirectusModule directus,
  })  : _authDio = dioModule.tokenDio,
        _directus = directus.getInstance();

  final Dio _authDio;
  final Future<Directus> _directus;

  Future<Either<AuthError, bool>> loginSdk({required String email, required String password}) async {
    final sdk = await _directus;
    try {
      await sdk.auth.login(email: email, password: password);
      return right(true);
    } catch (e) {
      return left(AuthError.invalidCredentials);
    }
  }

  Future<Either<AuthError, bool>> logoutSdk() async {
    final sdk = await _directus;
    try {
      await sdk.auth.logout();
      return right(true);
    } catch (e) {
      print(e);
      return left(AuthError.unexpected);
    }
  }

  Future<Either<AuthError, DirectusUser>> getCurrentUser() async {
    final sdk = await _directus;
    try {
      final DirectusResponse<DirectusUser>? user = await sdk.auth.currentUser?.read();
      if (user != null) {
        print(user.data);

        return right(user.data);
      }
    } catch (e) {
      await Future.delayed(Duration(seconds: 2));
      getCurrentUser();
    }

    return left(AuthError.userNotExist);
  }

  isUserLoggedIn() async {
    final sdk = await _directus;

    final isLoggedIn = sdk.auth.isLoggedIn;
    return isLoggedIn;
  }

  Future<Either<AuthError, AuthModel>> login({required String email, required String password}) async {
    try {
      final body = {'email': email, 'password': password};
      final response = await _authDio.post('$baseUrl$loginPath', data: body);
      final authDTO = AuthDTO.fromJson(response.data);
      final auth = authDTO.data.toDomain();
      return right(auth);
    } catch (e) {
      print(e);
      return left(AuthError.invalidCredentials);
    }
  }

  Future<Either<AuthError, Unit>> signup({
    required String email,
    required String password,
    required String roleId,
  }) async {
    try {
      final body = {'email': email, 'password': password, 'role': roleId};
      await _authDio.post('$baseUrl$signupPath', data: body);
      return right(unit);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) {
        return left(AuthError.userAlreadyExist);
      }
      return left(AuthError.unexpected);
    }
  }
}
