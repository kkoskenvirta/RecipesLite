import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/file/directus_file.dart';
import 'package:flutter_e_commerce/models/file/dto/directus_file_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_post_request_dto.dart';
import 'package:flutter_e_commerce/models/recipe/dto/recipe_single_dto.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/sort.dart';
import '../models/recipe/recipe_model.dart';
import '../modules/dio_module.dart';

enum FetchError { permissionError, unexpected, noResults, invalidPayload }

class RecipesRepository {
  RecipesRepository({required DioModule dioModule})
      : _tokenDio = dioModule.tokenDio,
        _dio = dioModule.dio;

  final Dio _tokenDio;
  final Dio _dio;

  String getSortString(SortBy sort) {
    String sortString;
    switch (sort) {
      case SortBy.favoritesAsc:
        sortString = "&sort=count(favorites)";
        break;
      case SortBy.favoritesDesc:
        sortString = "&sort=-count(favorites)";
        break;
      case SortBy.newest:
        sortString = "&sort=date_created";
        break;
      case SortBy.oldest:
        sortString = "&sort=-date_created";
        break;
      default:
        sortString = "";
    }
    return sortString;
  }

  Future<Either<FetchError, List<RecipeModel>?>> getRecipesList({int? limit, int? page, String? filters}) async {
    try {
      String resultLimit = '&limit=-1';
      String resultFilters = '';
      if (limit != null) {
        resultLimit = '&limit=$limit';
      }
      if (page != null) {
        resultLimit = '$resultLimit&page=$page';
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

  Future<Either<FetchError, List<RecipeModel>?>> getRecipesListWithFilters({
    int? limit,
    int? page,
    required List<TagModel> tags,
    required List<CategoryModel> categories,
    required SortBy sort,
    required String search,
  }) async {
    try {
      String resultLimit = '&limit=-1';
      List<String> tagQueryList = [];
      List<String> categoryQueryList = [];
      String tagQueryString = "";
      String categoryQueryString = "";
      String sortQuery = getSortString(sort);
      String searchQuery = "";
      String filterQuery =
          '&filter={"_and":[{"_and":[{"status":{"_eq":"published"}}]},{"status":{"_neq":"archived"}}]}';

      if (limit != null) {
        resultLimit = '&limit=$limit';
      }
      if (page != null) {
        resultLimit = '$resultLimit&page=$page';
      }

      if (search.isNotEmpty) {
        searchQuery =
            ',{"_or":[{"name":{"_icontains":"$search"}},{"categories":{"category_id":{"name":{"_icontains":"$search"}}}},{"tags":{"tag_id":{"name":{"_icontains":"$search"}}}}';
        filterQuery =
            '&filter={"_and":[{"_and":[{"_and":[{"_or":[{"name":{"_icontains":"$search"}},{"categories":{"category_id":{"name":{"_icontains":"$search"}}}},{"tags":{"tag_id":{"name":{"_icontains":"$search"}}}}]}]}]},{"status":{"_eq":"published"}}]}';
      }

      if (categories.isNotEmpty) {
        categoryQueryList = categories.map((category) {
          return '{"categories":{"category_id":{"id":{"_eq":"${category.id}"}}}}';
        }).toList();
        categoryQueryString = categoryQueryList.join(',');
        filterQuery = '&filter={"_and":[{"_and":[{"_and":[$categoryQueryString]}]},{"status":{"_eq":"published"}}]}';
        if (searchQuery.isNotEmpty) {
          filterQuery =
              '&filter={"_and":[{"_and":[{"_and":[$categoryQueryString$searchQuery]}]},{"status":{"_eq":"published"}}]}]}';
        }
      }

      if (tags.isNotEmpty) {
        tagQueryList = tags.map((tag) {
          return '{"tags":{"tag_id":{"id":{"_eq":"${tag.id}"}}}}';
        }).toList();
        tagQueryString = tagQueryList.join(',');
        filterQuery = '&filter={"_and":[{"_and":[{"_and":[$tagQueryString]}]},{"status":{"_eq":"published"}}]}';
        if (searchQuery.isNotEmpty) {
          filterQuery =
              '&filter={"_and":[{"_and":[{"_and":[$tagQueryString$searchQuery]}]},{"status":{"_eq":"published"}}]}]}';
        }
      }

      if (tags.isNotEmpty && categories.isNotEmpty) {
        filterQuery =
            '&filter={"_and":[{"_and":[{"_and":[$tagQueryString,$categoryQueryString$searchQuery]}]},{"status":{"_eq":"published"}}]}';
        if (searchQuery.isNotEmpty) {
          filterQuery =
              '&filter={"_and":[{"_and":[{"_and":[$tagQueryString,$categoryQueryString$searchQuery]}]},{"status":{"_eq":"published"}}]}]}';
        }
      }

      final Response response = await _tokenDio.get('$baseUrl$recipesPathFields$filterQuery$sortQuery$resultLimit');

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
          '&filter={"_and":[{"_and":[{"categories":{"category_id":{"id":{"_eq":"${category.id}"}}}}]},{"status":{"_eq":"published"}}]}';
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
      final body = recipe.toJson();
      _dio.options.headers['Content-Type'] = "application/json; charset=utf-8";
      await _dio.post(recipesPath, data: body);
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
      final body = recipe.toJson();
      _dio.options.headers['Content-Type'] = "application/json; charset=utf-8";
      await _dio.patch('$recipesPath$id', data: body);
      return right(Unit);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(FetchError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(FetchError.permissionError);
      return left(FetchError.unexpected);
    }
  }
}
