import 'package:dio/dio.dart';
import 'package:directus/directus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/models/favorite/dto/favorite_dto.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/user/dto/user_object_dto.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/models/user_data/dto/user_data_dto.dart';
import 'package:flutter_e_commerce/models/user_data/dto/user_data_object_dto.dart';
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
  }) : _dio = dioModule.dio;

  final Dio _dio;

  UserModel? currentUser;
  UserDataModel? userData;

  Future<Either<UserDataError, List<RecipeModel>>> getUserFavorites(UserModel user) async {
    try {
      currentUser ??= user;
      if (currentUser != null) {
        if (userData == null) {
          final failureOrUserData = await loadUserData(currentUser!.id);

          failureOrUserData.fold((error) => print(error), (data) {
            userData = data;
          });
        }

        return right(userData!.favorites);
      }
      return left(UserDataError.noCurrentUser);
    } catch (e) {
      return left(UserDataError.unexpected);
    }
  }

  Future<Either<UserDataError, UserDataModel>> loadUserData(String userId) async {
    try {
      final UserDataModel userData;

      final response = await _dio
          .get("$userDataPath?filter[user][_eq]=${currentUser?.id}&fields=id,user,favorites.recipe_id.*&limit=1");

      if (response.data.isEmpty) {
        //If we cant find existing user_data with current user id, we create a new one
        userData = await createUserData();
      } else {
        final userDataDTO = UserDataObjectDTO.fromJson(response.data);
        userData = userDataDTO.data[0].toDomain();
      }

      return right(userData);
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(UserDataError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(UserDataError.invalidCredentials);
      return left(UserDataError.unexpected);
    }
  }

  Future<dynamic> createUserData() async {
    try {
      final body = {'user': currentUser?.id, 'favorites': []};
      final response = await _dio.post(userDataPath, data: body);

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
      final response = await _dio.patch("$userDataPath${userData!.id}", data: body);

      return response;
    } catch (e) {
      if (e is DioError && e.response?.statusCode == 400) return left(UserDataError.invalidPayload);
      if (e is DioError && e.response?.statusCode == 401) return left(UserDataError.invalidCredentials);
      return left(UserDataError.unexpected);
    }
  }
}
