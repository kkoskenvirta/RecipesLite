import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:directus/directus.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerce/models/favorite/favorite_model.dart';
import 'package:flutter_e_commerce/models/user/dto/user_data_dto.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import '../modules/dio_module.dart';

enum UserError {
  userNotExist,
  invalidCredentials,
  userAlreadyExist,
  invalidPayload,
  roleNoteFound,
  unexpected,
  itemNotFound,
  noCurrentUser
}

class UserRepository {
  UserRepository({
    required DioModule dioModule,
    required DirectusModule directus,
  })  : _UserDio = dioModule.tokenDio,
        _directus = directus.getInstance();

  final Dio _UserDio;
  final Future<Directus> _directus;

  DirectusUser? currentUser;
  UserModel? userData;

  Future<Either<UserError, DirectusUser>> getCurrentUser() async {
    currentUser ??= await loadDirectusUser();
    if (currentUser != null) {
      return right(currentUser!);
    }
    return left(UserError.userNotExist);
  }

  Future<Either<UserError, List<FavoriteModel>>> getUserFavorites() async {
    currentUser ??= await loadDirectusUser();
    if (currentUser != null) {
      userData ??= await loadUserData(currentUser!.id!);
      return right(userData!.favorites);
    } else {
      return left(UserError.noCurrentUser);
    }
  }

  loadDirectusUser() async {
    final sdk = await _directus;
    try {
      final response = await sdk.auth.currentUser?.read();
      if (response != null) {
        response.data;
        return response.data;
      }
    } catch (e) {
      await Future.delayed(Duration(seconds: 2));
      loadDirectusUser();
    }
  }

  loadUserData(String userId) async {
    try {
      final sdk = await _directus;
      final responseData;

      //Look for existing user data from directus user_data collection
      final response = await sdk.items("user_data").readMany(
            query: Query(limit: 1, fields: ['id', 'user', 'favorites.*']),
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
      final userDataDTO = UserDataDTO.fromJson(responseData);
      final userData = userDataDTO.toDomain();

      return userData;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> createUserData(Directus sdk) async {
    try {
      final response = await sdk.items("user_data").createOne(
        {
          'user': currentUser?.id,
          'favorites': [],
        },
      );
      final responseData = response.data;
      return responseData;
    } catch (e) {
      throw UserError.unexpected;
    }
  }

  updateLocalUserData(String id, String userId, List<FavoriteModel> favorites) {
    userData = UserModel(id: id, userId: userId, favorites: favorites);
  }

  Future<DirectusResponse> updateFavoritesList(List<FavoriteModel> newFavorites) async {
    final sdk = await _directus;

    updateLocalUserData(userData!.id, userData!.userId, newFavorites);
    try {
      DirectusResponse response = await sdk.items("user_data").updateOne(
        id: userData!.id,
        data: {'favorites': newFavorites},
      );
      return response;
    } catch (e) {
      await sdk.auth.manuallyRefresh();
      DirectusResponse response = await sdk.items("user_data").updateOne(
        id: userData!.id,
        data: {'favorites': newFavorites},
      );
      return response;
    }
  }
}
