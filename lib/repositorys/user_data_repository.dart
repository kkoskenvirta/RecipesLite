import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/directus/dto/get_many_directus_items_dto.dart';
import 'package:flutter_e_commerce/models/directus/dto/get_one_directus_item_dto.dart';
import 'package:flutter_e_commerce/models/user_data/dto/user_data_dto.dart';
import 'package:flutter_e_commerce/models/user_data/dto/user_data_object_dto.dart';
import 'package:flutter_e_commerce/models/user_data/user_data_model.dart';
import '../modules/dio_module.dart';

enum UserDataError {
  userNotExist,
  invalidCredentials,
  userAlreadyExist,
  invalidPayload,
  roleNoteFound,
  unexpected,
  itemNotFound,
  noCurrentUser,
  permissionError,
}

class UserDataRepository {
  UserDataRepository({
    required DioModule dioModule,
  }) : _dio = dioModule.dio;

  final Dio _dio;

  Future<Either<UserDataError, UserDataModel>> getUserData(String userId) async {
    try {
      final response = await _dio.get(
          "$userDataPath?filter[user][_eq]=$userId&fields=id,user,favorites.recipe_id.*,favorites.recipe_id.categories.category_id.*,favorites.recipe_id.tags.tag_id.*,favorites.recipe_id.ingredient_groups.id,favorites.recipe_id.ingredient_groups.id.*,favorites.recipe_id.ingredient_groups.ingredient_group_id.ingredients.ingredient_id.*,favorites.recipe_id.ingredient_groups.ingredient_group_id.ingredients.id&limit=1");
      final userDataDTO = UserDataObjectDTO.fromJson(response.data);
      final UserDataModel userData =
          userDataDTO.data.isNotEmpty ? userDataDTO.data[0].toDomain() : await createUserData(userId);
      return right(userData);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(UserDataError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(UserDataError.invalidCredentials);
      return left(UserDataError.unexpected);
    }
  }

  Future<Either<UserDataError, void>> deleteUserData(String id) async {
    try {
      await _dio.delete(
        '/items/user_data/$id',
      );
      return right(null);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(UserDataError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(UserDataError.invalidCredentials);
      return left(UserDataError.unexpected);
    }
  }

  Future<dynamic> createUserData(String userId) async {
    try {
      final body = {'user': userId, 'favorites': []};
      final response = await _dio.post(userDataPath, data: body);
      final responseDTO = GetOneDirectusItemDTO.fromJson(response.data);
      final userData = UserDataDTO.fromJson(responseDTO.data).toDomain();
      return userData;
    } catch (e) {
      throw UserDataError.unexpected;
    }
  }

  Future<dynamic> updateFavoritesList(List<dynamic> newFavorites, String userId) async {
    try {
      final body = {'favorites': newFavorites};
      final response = await _dio.patch("$userDataPath/$userId", data: body);
      return response;
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(UserDataError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(UserDataError.invalidCredentials);
      return left(UserDataError.unexpected);
    }
  }
}
