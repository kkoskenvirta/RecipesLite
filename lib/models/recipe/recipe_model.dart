import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    required String id,
    required String status,
    required String difficulty,
    required double rating,
    required String picture,
    required String instructions,
    required String name,
    required bool featured,
    required int preparationTime,
    required String shortDescription,
    required int commentCount,
    required String userCreated,
    required DateTime dateCreated,
    dynamic dateUpdated,
  }) = _RecipeModel;

  const RecipeModel._();

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}
