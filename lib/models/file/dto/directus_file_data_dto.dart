import 'package:flutter_e_commerce/models/file/directus_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'directus_file_data_dto.freezed.dart';
part 'directus_file_data_dto.g.dart';

@freezed
class DirectusFileDataDTO with _$DirectusFileDataDTO {
  factory DirectusFileDataDTO({
    String? id,
    String? title,
  }) = _DirectusFileDataDTO;

  const DirectusFileDataDTO._();

  factory DirectusFileDataDTO.fromJson(Map<String, dynamic> json) => _$DirectusFileDataDTOFromJson(json);

  DirectusFile toDomain() {
    return DirectusFile(id: id);
  }
}
