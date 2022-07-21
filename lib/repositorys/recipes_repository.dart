import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_dto.dart';
import '../models/recipe/recipe_model.dart';
import '../modules/dio_module.dart';

enum FetchError { permissionError, unexpected, noResults, invalidPayload }

class RecipesRepository {
  RecipesRepository({required DioModule dioModule}) : _dio = dioModule.tokenDio;

  final Dio _dio;

  Future<Either<FetchError, List<RecipeModel>?>> getRecipesList() async {
    try {
      final Response response = await _dio.get('$baseUrl$recipesPath');

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
          '?filter={"_and":[{"_and":[{"categories":{"category_category_id":{"category_id":{"_eq":"${category.id}"}}}}]},{"status":{"_neq":"archived"}}]}';
      final Response response = await _dio.get('$baseUrl$recipesPath$filterQuery');

      final recipesDTO = RecipeDTO.fromJson(response.data);
      final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();

      return right(recipes);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }

  Future<Either<FetchError, List<RecipeModel>>> searchRecipes(String query) async {
    try {
      final Response? response;
      response = await _dio.get(query);
      final recipesDTO = RecipeDTO.fromJson(response.data);
      final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();

      return right(recipes);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }
}
