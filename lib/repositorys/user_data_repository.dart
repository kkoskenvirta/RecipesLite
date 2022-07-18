import 'package:dio/dio.dart';
import 'package:directus/directus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/models/favorite/dto/favorite_dto.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/user/dto/user_object_dto.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/models/user_data/dto/user_data_dto.dart';
import 'package:flutter_e_commerce/models/user_data/user_data_model.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import '../modules/dio_module.dart';

enum UserDataError {
  userNotExist,
  invalidCredentials,
  userAlreadyExist,
  invalidPayload,
  roleNoteFound,
  unexpected,
  itemNotFound,
  noCurrentUser
}

class UserDataRepository {
  UserDataRepository({
    required DioModule dioModule,
    required DirectusModule directus,
  })  : _dio = dioModule.dio,
        _directus = directus.getInstance();

  final Dio _dio;
  final Future<Directus> _directus;

  UserModel? currentUser;
  UserDataModel? userData;

  Future<Either<UserDataError, List<RecipeModel>>> getUserFavorites(UserModel user) async {
    try {
      currentUser ??= user;
      if (currentUser != null) {
        userData ??= await loadUserData(currentUser!.id);
        return right(userData!.favorites);
      }
      return left(UserDataError.noCurrentUser);
    } catch (e) {
      return left(UserDataError.unexpected);
    }
  }

  loadUserData(String userId) async {
    try {
      final sdk = await _directus;
      final responseData;

      //Look for existing user data from directus user_data collection
      final response = await sdk.items("user_data").readMany(
            query: Query(limit: 1, fields: ['id', 'user', 'favorites.recipe_id.*']),
            filters: Filters(
              {'user': Filter.eq(currentUser?.id)},
            ),
          );

      if (response.data.isEmpty) {
        //If we cant find existing user_data with current user id, we create a new one
        responseData = await createUserData(sdk);
      } else {
        responseData = response.data[0];
      }
      print(response.data);
      final userDataDTO = UserDataDTO.fromJson(responseData);
      final userData = userDataDTO.toDomain();

      return userData;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> createUserData(Directus sdk) async {
    try {
      final body = {'user': currentUser?.id, 'favorites': []};
      final response = await _dio.post("items/user_data", data: body);

      final userDataDTO = UserObjectDTO(data: response.data);
      final userData = userDataDTO.data.toDomain();

      return userData;
    } catch (e) {
      throw UserDataError.unexpected;
    }
  }

  updateLocalUserData(List<RecipeModel> favorites) {
    userData = UserDataModel(id: userData!.id, userId: userData!.userId, favorites: favorites);
  }

  Future<dynamic> updateFavoritesList(List<dynamic> newFavorites, UserModel user) async {
    try {
      final body = {'favorites': newFavorites};
      final response = await _dio.patch("items/user_data/${userData!.id}", data: body);

      return response;
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(UserDataError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(UserDataError.invalidCredentials);
      return left(UserDataError.unexpected);
    }
  }
}
