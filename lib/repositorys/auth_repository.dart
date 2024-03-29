import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/auth/auth_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/models/user/dto/user_object_dto.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';

import '../models/auth/dto/auth_dto.dart';
import '../modules/dio_module.dart';

enum AuthError {
  userNotExist,
  invalidCredentials,
  userAlreadyExist,
  invalidPayload,
  roleNoteFound,
  emailTaken,
  unexpected,
  permissionError,
}

class AuthRepository {
  AuthRepository({
    required DioModule dioModule,
    required SecureStorageRepository secureStorageRepository,
  })  : _authDio = dioModule.tokenDio,
        _secureStorageRepository = secureStorageRepository,
        _dio = dioModule.dio;

  final Dio _authDio;
  final Dio _dio;
  final SecureStorageRepository _secureStorageRepository;
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'https://www.googleapis.com/auth/contacts.readonly',
  //   ],
  // );
  Future<Either<AuthError, AuthModel>> login({required String email, required String password}) async {
    try {
      final body = {'email': email, 'password': password};
      final response = await _authDio.post('/auth/login', data: body);
      final authDTO = AuthDTO.fromJson(response.data);
      final auth = authDTO.data.toDomain();
      return right(auth);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.userNotExist);
      if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
      return left(AuthError.unexpected);
    }
  }

  Future<Either<AuthError, void>> logout({required String refreshToken}) async {
    try {
      final body = {'refresh_token': refreshToken};
      await _authDio.post('/auth/logout', data: body);
      return right(null);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.userNotExist);
      if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
      return left(AuthError.unexpected);
    }
  }

  Future<Either<AuthError, void>> deleteAccount({required String accountId}) async {
    try {
      await _dio.delete(
        '/users/$accountId',
      );
      return right(null);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.userNotExist);
      if (e is DioError && e.response?.statusCode == 401) return left(AuthError.permissionError);
      return left(AuthError.unexpected);
    }
  }

  Future<Either<AuthError, UserModel>> getCurrentUser() async {
    try {
      final response = await _dio.get("users/me");

      if (response.data != null) {
        final userDTO = UserObjectDTO.fromJson(response.data);
        final user = userDTO.data.toDomain();
        return right(user);
      }
      return left(AuthError.userNotExist);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
      return left(AuthError.unexpected);
    }
  }

  isUserLoggedIn() async {
    final accessToken = await _secureStorageRepository.getWithKey(StorageKeys.accessToken);
    final refreshToken = await _secureStorageRepository.getWithKey(StorageKeys.refreshToken);

    if (accessToken == null || refreshToken == null) return false;
    return true;
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

  Future<Either<AuthError, AuthModel>> refreshAccessToken({required String refreshToken}) async {
    try {
      final body = {'refresh_token': refreshToken};
      final response = await _authDio.post('/auth/refresh', data: body);
      final authDTO = AuthDTO.fromJson(response.data);
      final auth = authDTO.data.toDomain();
      await _secureStorageRepository.setWithKey(StorageKeys.accessToken, auth.accessToken.toString());
      await _secureStorageRepository.setWithKey(StorageKeys.refreshToken, auth.refreshToken.toString());
      return right(auth);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
      return left(AuthError.unexpected);
    }
  }

  Future<Either<AuthError, UserModel>> register(
      {required String username, required String email, required String password}) async {
    try {
      final body = {
        'first_name': username,
        'email': email,
        'password': password,
        'role': '06121d77-d40a-49ae-89c2-9b547200a2d8',
      };
      final response = await _authDio.post('/users', data: body);
      final userDTO = UserObjectDTO.fromJson(response.data);
      final user = userDTO.data.toDomain();
      return right(user);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.emailTaken);
      // if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
      return left(AuthError.unexpected);
    }
  }
  // Future<Either<AuthError, bool>> loginWithProvider({required String provider}) async {
  //   try {
  //     switch (provider) {
  //       case "google":
  //         final providerResponse = await loginWithGoogle();
  //         // final auth = await ssoRefreshAccessToken();

  //         print(providerResponse);
  //         break;
  //       default:
  //     }
  //     // final response = await _authDio.get('/auth/login/$provider');
  //     // final authDTO = AuthDTO.fromJson(response.data);
  //     // final auth = authDTO.data.toDomain();
  //     return right(true);
  //   } catch (e) {
  //     if (e is DioError && e.response?.statusCode == 400) return left(AuthError.userNotExist);
  //     if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
  //     return left(AuthError.unexpected);
  //   }
  // }

  // Future<GoogleSignInAccount?> loginWithGoogle() async {
  //   final result = await FlutterWebAuth.authenticate(
  //     url:
  //         "${baseUrl}auth/login/google?redirect=recipeslite://?state=code=4/0AdQt8qhsiEuJwaLUQxDw2oziS6O8D-FRkBSqeZ9CvVNf6fxuwqyQIXYEbaPG83mkQcjsrg&scope=email+profile+openid+https://www.googleapis.com/auth/userinfo.email+https://www.googleapis.com/auth/userinfo.profile&authuser=0&prompt=none",
  //     callbackUrlScheme: "recipeslite",
  //   );

  //   print(result);
  //   final token = Uri.parse(result).queryParameters['token'];
  //   return null;
  // }
  // Future<GoogleSignInAccount?> loginWithGoogle() => _googleSignIn.signIn();

  // Future<Either<AuthError, AuthModel>> ssoRefreshAccessToken({required String refreshToken}) async {
  //   try {
  //     Dio tempDio = _authDio;
  //     tempDio.options.extra['withCredentials'] = true;
  //     final body = {'refresh_token': refreshToken};
  //     final response = await tempDio.post('/auth/refresh', data: body);
  //     final authDTO = AuthDTO.fromJson(response.data);
  //     final auth = authDTO.data.toDomain();
  //     await _secureStorageRepository.setWithKey(StorageKeys.accessToken, auth.accessToken.toString());
  //     await _secureStorageRepository.setWithKey(StorageKeys.refreshToken, auth.refreshToken.toString());
  //     return right(auth);
  //   } catch (e) {
  //     if (e is DioError && e.response?.statusCode == 400) return left(AuthError.invalidPayload);
  //     if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
  //     return left(AuthError.unexpected);
  //   }
  // }
}
