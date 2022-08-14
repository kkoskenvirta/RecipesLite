import 'package:flutter_e_commerce/models/tag/dto/tag_data_dto.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_id_dto.freezed.dart';
part 'tag_id_dto.g.dart';

@freezed
class TagIdDTO with _$TagIdDTO {
  factory TagIdDTO({
    @JsonKey(name: "id") required int? relationId,
    @JsonKey(name: "tag_id") required TagDataDTO tag,
  }) = _TagIdDTO;

  const TagIdDTO._();

  factory TagIdDTO.fromJson(Map<String, dynamic> json) => _$TagIdDTOFromJson(json);

  TagModel toDomain() {
    return TagModel(
      id: tag.id,
      name: tag.name,
      relationId: relationId,
      sort: tag.sort,
      status: tag.status,
    );
  }
}
