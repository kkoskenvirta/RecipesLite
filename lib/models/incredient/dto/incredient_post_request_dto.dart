import 'package:freezed_annotation/freezed_annotation.dart';

part 'incredient_post_request_dto.freezed.dart';
part 'incredient_post_request_dto.g.dart';

@freezed
class IncredientPostRequestDTO with _$IncredientPostRequestDTO {
  factory IncredientPostRequestDTO({
    String? name,
    double? amount,
    String? unit,
  }) = _IncredientPostRequestDTO;

  const IncredientPostRequestDTO._();

  factory IncredientPostRequestDTO.fromJson(Map<String, dynamic> json) => _$IncredientPostRequestDTOFromJson(json);

  factory IncredientPostRequestDTO.create() {
    return IncredientPostRequestDTO(
      name: "",
      amount: null,
      unit: "gram",
    );
  }
}
