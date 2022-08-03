import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_model.freezed.dart';
part 'ingredient_model.g.dart';

@freezed
class IngredientModel with _$IngredientModel {
  factory IngredientModel({
    String? id,
    int? relationId,
    required String name,
    double? amount,
    String? unit,
  }) = _IngredientModel;

  const IngredientModel._();

  factory IngredientModel.fromJson(Map<String, dynamic> json) => _$IngredientModelFromJson(json);

  factory IngredientModel.create() {
    return IngredientModel(
      name: "",
      amount: null,
      unit: "gram",
    );
  }
}
