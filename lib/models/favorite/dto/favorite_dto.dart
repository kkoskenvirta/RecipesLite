import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_dto.freezed.dart';
part 'favorite_dto.g.dart';

@freezed
class FavoriteDTO with _$FavoriteDTO {
  factory FavoriteDTO({
    @JsonKey(name: 'recipe_id') required String recipeId,
    @JsonKey(name: 'user_id') required String userId,
  }) = _FavoriteDTO;

  const FavoriteDTO._();

  factory FavoriteDTO.fromJson(Map<String, dynamic> json) => _$FavoriteDTOFromJson(json);
}
