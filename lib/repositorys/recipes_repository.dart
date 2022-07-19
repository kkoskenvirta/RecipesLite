import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_dto.dart';
import '../models/recipe/recipe_model.dart';
import '../modules/dio_module.dart';

enum FetchError { permissionError, unexpected, noResults }

class RecipesRepository {
  RecipesRepository({required DioModule dio}) : _dio = dio.tokenDio;

  final Dio _dio;

  Future<List<RecipeModel>?> getRecipesList() async {
    try {
      final Response? response = await _dio.get('$baseUrl$recipesPath');

      if (response != null) {
        final recipesDTO = RecipeDTO.fromJson(response.data);
        final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();

        return recipes;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Either<FetchError, List<RecipeModel>>> searchRecipes(String query) async {
    try {
      final Response? response;
      response = await _dio.get(query);
      final recipesDTO = RecipeDTO.fromJson(response.data);
      final recipes = recipesDTO.data.map((recipeDataDTO) => recipeDataDTO.toDomain()).toList();

      return right(recipes);
      return left(FetchError.noResults);
    } catch (e) {
      return left(FetchError.unexpected);
    }
  }
}
