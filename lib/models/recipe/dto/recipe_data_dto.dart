import 'package:freezed_annotation/freezed_annotation.dart';
import '../recipe_model.dart';

part 'recipe_data_dto.freezed.dart';
part 'recipe_data_dto.g.dart';

@freezed
class RecipeDataDTO with _$RecipeDataDTO {
  factory RecipeDataDTO({
    required String id,
    required String status,
    required String difficulty,
    required double rating,
    required String picture,
    @Default('') String instructions,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Featured') required bool featured,
    @JsonKey(name: 'preparation_time') required int preparationTime,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'comment_count') required int commentCount,
    @JsonKey(name: 'user_created') required String userCreated,
    @JsonKey(name: 'date_created') required DateTime dateCreated,
    @JsonKey(name: 'date_updated') dynamic dateUpdated,
  }) = _RecipeDataDTO;

  const RecipeDataDTO._();

  factory RecipeDataDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDataDTOFromJson(json);

  RecipeModel toDomain() {
    return RecipeModel(
      id: id,
      dateCreated: dateCreated,
      dateUpdated: dateUpdated,
      commentCount: commentCount,
      difficulty: difficulty,
      featured: featured,
      name: name,
      picture: picture,
      preparationTime: preparationTime,
      rating: rating,
      shortDescription: shortDescription,
      status: status,
      userCreated: userCreated,
      instructions: instructions,
    );
  }
}
