import 'package:flutter_e_commerce/models/favorite/favorite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_data_dto.freezed.dart';
part 'favorite_data_dto.g.dart';

@freezed
class FavoriteDataDTO with _$FavoriteDataDTO {
  factory FavoriteDataDTO({
    @JsonKey(name: 'recipe_id') required String recipeId,
    @JsonKey(name: 'user_data_id') required String userId,
  }) = _FavoriteDataDTO;

  const FavoriteDataDTO._();

  factory FavoriteDataDTO.fromJson(Map<String, dynamic> json) => _$FavoriteDataDTOFromJson(json);

  FavoriteModel toDomain() {
    return FavoriteModel(
      recipeId: recipeId,
      userId: userId,
    );
  }
}
