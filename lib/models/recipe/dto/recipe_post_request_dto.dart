import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_post_request_dto.freezed.dart';
part 'recipe_post_request_dto.g.dart';

@freezed
class RecipePostRequestDTO with _$RecipePostRequestDTO {
  factory RecipePostRequestDTO({
    String? difficulty,
    String? blurhash,
    String? picture,
    required String instructions,
    required Map<String, dynamic> categories,
    required Map<String, dynamic> tags,
    required String name,
    @JsonKey(name: 'ingredient_groups') required Map<String, dynamic> ingredientGroups,
    @JsonKey(name: 'preparation_time') int? preparationTime,
    @JsonKey(name: 'short_description') String? shortDescription,
  }) = _RecipePostRequestDTO;

  const RecipePostRequestDTO._();

  factory RecipePostRequestDTO.fromJson(Map<String, dynamic> json) => _$RecipePostRequestDTOFromJson(json);
}
