import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
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

    dio.interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
        final accessToken = await SecureStorageRepository().getWithKey(StorageKeys.accessToken);
        options.headers["Authorization"] = 'Bearer $accessToken';
        print(accessToken);
        return handler.next(options);
      }, onError: (DioError e, handler) async {
        if (e.response?.statusCode == 401) {
          final refreshToken = await SecureStorageRepository().getWithKey(StorageKeys.refreshToken);
          final failureOrAuth = await AuthRepository(
            dioModule: DioModule(),
            secureStorageRepository: SecureStorageRepository(),
          ).refreshAccessToken(refreshToken: refreshToken.toString());
          failureOrAuth.fold((error) {
            AuthCubit(
                secureStorageRepository: SecureStorageRepository(),
                authRepository: AuthRepository(
                  dioModule: DioModule(),
                  secureStorageRepository: SecureStorageRepository(),
                )).logout();
            handler.reject(e);
          }, (auth) async {
            print(auth);
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
}
