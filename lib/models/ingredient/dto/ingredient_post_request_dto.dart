import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_post_request_dto.freezed.dart';
part 'ingredient_post_request_dto.g.dart';

@freezed
class ingredientPostRequestDTO with _$ingredientPostRequestDTO {
  factory ingredientPostRequestDTO({
    String? name,
    double? amount,
    String? unit,
  }) = _ingredientPostRequestDTO;

  const ingredientPostRequestDTO._();

  factory ingredientPostRequestDTO.fromJson(Map<String, dynamic> json) => _$ingredientPostRequestDTOFromJson(json);

  factory ingredientPostRequestDTO.create() {
    return ingredientPostRequestDTO(
      name: "",
      amount: null,
      unit: "gram",
    );
  }
}
