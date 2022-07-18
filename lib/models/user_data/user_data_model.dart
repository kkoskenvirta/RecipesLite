import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';

@freezed
class UserDataModel with _$UserDataModel {
  factory UserDataModel({
    required String id,
    required String userId,
    required List<RecipeModel> favorites,
  }) = _UserDataModel;
}
