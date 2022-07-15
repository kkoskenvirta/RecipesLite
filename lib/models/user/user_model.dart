import 'package:flutter_e_commerce/models/favorite/favorite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String userId,
    required List<FavoriteModel> favorites,
  }) = _UserModel;
}
