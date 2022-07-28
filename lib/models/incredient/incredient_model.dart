import 'package:freezed_annotation/freezed_annotation.dart';

part 'incredient_model.freezed.dart';
part 'incredient_model.g.dart';

@freezed
class IncredientModel with _$IncredientModel {
  factory IncredientModel({
    String? id,
    String? name,
    double? amount,
    String? unit,
  }) = _IncredientModel;

  const IncredientModel._();

  factory IncredientModel.fromJson(Map<String, dynamic> json) => _$IncredientModelFromJson(json);

  factory IncredientModel.create() {
    return IncredientModel(
      name: "",
      amount: null,
      unit: "gram",
    );
  }
}
