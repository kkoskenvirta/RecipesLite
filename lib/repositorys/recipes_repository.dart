import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/file/directus_file.dart';
import 'package:flutter_e_commerce/models/file/dto/directus_file_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_data_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_post_request_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_single_dto.dart';
import '../models/recipe/recipe_model.dart';
import '../modules/dio_module.dart';

enum FetchError { permissionError, unexpected, noResults, invalidPayload }

class RecipesRepository {
  RecipesRepository({required DioModule dioModule})
      : _tokenDio = dioModule.tokenDio,
        _dio = dioModule.dio;

  final Dio _tokenDio;
  final Dio _dio;

  Future<Either<FetchError, List<RecipeModel>?>> getRecipesList({int? limit, String? filters}) async {
    try {
      String resultLimit = '&limit=-1';
      String resultFilters = '';
      if (limit != null) {
        resultLimit = '&limit=$limit';
      }
      if (filters != null) {
        resultFilters = filters;
      }

      final Response response = await _tokenDio.get('$baseUrl$recipesPathFields$resultLimit$resultFilters');
      final recipesDTO = RecipeDTO.fromJson(response.data);
      final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();

      return right(recipes);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, List<RecipeModel>?>> getRecipesListWithCategory(CategoryModel category) async {
    try {
      final String filterQuery =
          '&filter={"_and":[{"_and":[{"categories":{"category_category_id":{"category_id":{"_eq":"${category.id}"}}}}]},{"status":{"_neq":"archived"}}]}';
      final Response response = await _tokenDio.get('$baseUrl$recipesPathFields$filterQuery');

      final recipesDTO = RecipeDTO.fromJson(response.data);
      final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();

      return right(recipes);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, List<RecipeModel>>> searchRecipes({required String filters}) async {
    try {
      final Response? response;
      response = await _tokenDio.get('$baseUrl$recipesPathFields$filters');

      if (response.data != null) {
        final recipesDTO = RecipeDTO.fromJson(response.data);
        final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();
        return right(recipes);
      }
      return right([]);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, RecipeModel>> getRecipeWithId({required String id}) async {
    try {
      final Response? response;
      response = await _tokenDio.get('$baseUrl$recipesPath$id$recipeFields');

      final recipesDTO = RecipeSingleDTO.fromJson(response.data);
      final recipe = recipesDTO.data.toDomain();
      return right(recipe);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, dynamic>> addRecipe(RecipePostRequestDTO recipe) async {
    try {
      final Response? response;
      final body = recipe.toJson();
      _dio.options.headers['Content-Type'] = "application/json; charset=utf-8";
      response = await _dio.post(recipesPath, data: body);
      return right(Unit);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, DirectusFile>> uploadImage(FormData image) async {
    try {
      final Response? response;

      //Save default dio content type
      final dioContentType = _dio.options.headers['Content-Type'];
      _dio.options.headers['Content-Type'] = "multipart/form-data";

      response = await _dio.post(
        filesPath,
        data: image,
      );

      //reset content type to previous
      _dio.options.headers['Content-Type'] = dioContentType;

      final fileDataDTO = DirectusFileDTO.fromJson(response.data);
      final file = fileDataDTO.data.toDomain();

      return right(file);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, dynamic>> modifyRecipe(RecipePostRequestDTO recipe, String id) async {
    try {
      final Response? response;
      final body = recipe.toJson();
      _dio.options.headers['Content-Type'] = "application/json; charset=utf-8";
      response = await _dio.patch('$recipesPath/$id', data: body);
      return right(Unit);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }
}
