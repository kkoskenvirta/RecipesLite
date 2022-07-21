import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    required String id,
    required String difficulty,
    required String picture,
    required String instructions,
    required String name,
    required bool featured,
    required int preparationTime,
    required String shortDescription,
    required int commentCount,
    String? status,
    double? rating,
    String? userCreated,
    DateTime? dateCreated,
    dynamic dateUpdated,
  }) = _RecipeModel;

  const RecipeModel._();

  factory RecipeModel.fromJson(Map<String, dynamic> json) => _$RecipeModelFromJson(json);
}
