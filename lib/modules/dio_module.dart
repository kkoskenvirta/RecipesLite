import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';

class DioModule {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: baseUrl));

  DioModule._internal();

  static final _singleton = DioModule._internal();

  factory DioModule() => _singleton;

  static Dio createDio() {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));

    return dio;
  }
}
