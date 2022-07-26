import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_data_dto.freezed.dart';
part 'tag_data_dto.g.dart';

@freezed
class TagDataDTO with _$TagDataDTO {
  factory TagDataDTO({
    required String id,
    @JsonKey(name: 'tag_name') @Default('') String name,
    String? status,
    String? sort,
  }) = _TagDataDTO;

  const TagDataDTO._();

  factory TagDataDTO.fromJson(Map<String, dynamic> json) => _$TagDataDTOFromJson(json);

  TagModel toDomain() {
    return TagModel(id: id, name: name, status: status, sort: sort);
  }
}
