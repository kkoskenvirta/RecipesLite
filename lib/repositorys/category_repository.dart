import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/category/dto/category_dto.dart';
import 'package:flutter_e_commerce/models/tag/dto/tag_dto.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import '../modules/dio_module.dart';

enum CategoryFetchError { permissionError, unexpected, noResults, invalidPayload }

class CategoryRepository {
  CategoryRepository({required DioModule dioModule}) : _dio = dioModule.tokenDio;

  final Dio _dio;

  Future<Either<CategoryFetchError, List<CategoryModel>?>> getCategoryList() async {
    try {
      final Response response = await _dio.get(categoryPath);
      final categoriesDTO = CategoryDTO.fromJson(response.data);
      final categories = categoriesDTO.data.map((categoryDataDTO) => categoryDataDTO.toDomain()).toList();
      return right(categories);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(CategoryFetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(CategoryFetchError.permissionError);
      return left(CategoryFetchError.unexpected);
    }
  }

  Future<Either<CategoryFetchError, List<TagModel>?>> getTagList() async {
    try {
      final Response response = await _dio.get(tagPath);
      final tagsDTO = TagDTO.fromJson(response.data);
      final tags = tagsDTO.data.map((tagDataDTO) => tagDataDTO.toDomain()).toList();
      return right(tags);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(CategoryFetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(CategoryFetchError.permissionError);
      return left(CategoryFetchError.unexpected);
    }
  }
}
