import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

@freezed
class FavoriteModel with _$FavoriteModel {
  factory FavoriteModel({
    @JsonKey(name: 'recipe_id') required String recipeId,
    @JsonKey(name: 'user_id') required String userId,
  }) = _FavoriteModel;

  const FavoriteModel._();

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => _$FavoriteModelFromJson(json);
}
