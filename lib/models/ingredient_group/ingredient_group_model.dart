import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_group_model.freezed.dart';
part 'ingredient_group_model.g.dart';

@freezed
class IngredientGroupModel with _$IngredientGroupModel {
  factory IngredientGroupModel({
    int? relationId,
    String? id,
    String? name,
    List<IngredientModel>? ingredients,
  }) = _IngredientGroupModel;

  const IngredientGroupModel._();

  factory IngredientGroupModel.fromJson(Map<String, dynamic> json) => _$IngredientGroupModelFromJson(json);

  factory IngredientGroupModel.create() {
    return IngredientGroupModel(
      id: "",
      name: "",
      ingredients: [],
    );
  }
}
