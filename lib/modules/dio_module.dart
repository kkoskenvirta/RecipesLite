import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/auth/auth_model.dart';
import 'package:flutter_e_commerce/models/auth/dto/auth_dto.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';

class DioModule {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  DioModule._internal();

  static final _singleton = DioModule._internal();

  factory DioModule() => _singleton;

  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));
    final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

    dio.interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
        final accessToken = await SecureStorageRepository().getWithKey(StorageKeys.accessToken);
        options.headers["Authorization"] = 'Bearer $accessToken';
        print(accessToken);
        return handler.next(options);
      }, onError: (DioError e, handler) async {
        if (e.response?.statusCode == 401) {
          final refreshToken = await SecureStorageRepository().getWithKey(StorageKeys.refreshToken);
          final failureOrAuth = await refreshAccessToken(refreshToken: refreshToken.toString(), dio: tokenDio);
          failureOrAuth.fold((error) {
            handler.reject(e);
          }, (auth) async {
            final retryRequest = await dio.request(e.requestOptions.path,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters,
                options: Options(method: e.requestOptions.method, headers: e.requestOptions.headers));
            handler.resolve(retryRequest);
          });
        }
        return;
      }),
      LogInterceptor(request: false, requestHeader: false, responseHeader: false, requestBody: false)
    ]);

    return dio;
  }

  static Future<Either<AuthError, AuthModel>> refreshAccessToken(
      {required String refreshToken, required Dio dio}) async {
    try {
      final body = {'refresh_token': refreshToken};
      final response = await dio.post('/auth/refresh', data: body);
      final authDTO = AuthDTO.fromJson(response.data);
      final auth = authDTO.data.toDomain();
      await SecureStorageRepository().setWithKey(StorageKeys.accessToken, auth.accessToken.toString());
      await SecureStorageRepository().setWithKey(StorageKeys.refreshToken, auth.refreshToken.toString());
      return right(auth);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(AuthError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(AuthError.invalidCredentials);
      return left(AuthError.unexpected);
    }
  }
}
