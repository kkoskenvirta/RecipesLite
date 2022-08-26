import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_post_request_dto.freezed.dart';
part 'ingredient_post_request_dto.g.dart';

@freezed
class IngredientPostRequestDTO with _$IngredientPostRequestDTO {
  factory IngredientPostRequestDTO({
    String? name,
    double? amount,
    String? unit,
  }) = _IngredientPostRequestDTO;

  const IngredientPostRequestDTO._();

  factory IngredientPostRequestDTO.fromJson(Map<String, dynamic> json) => _$IngredientPostRequestDTOFromJson(json);

  factory IngredientPostRequestDTO.create() {
    return IngredientPostRequestDTO(
      name: "",
      amount: null,
      unit: "gram",
    );
  }
}
