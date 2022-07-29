import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data_dto.freezed.dart';
part 'category_data_dto.g.dart';

@freezed
class CategoryDataDTO with _$CategoryDataDTO {
  factory CategoryDataDTO({
    @JsonKey(name: 'category_id') required String id,
    @JsonKey(name: 'category_name') @Default('') String name,
    @JsonKey(name: 'category_picture') @Default('') String picture,
    @JsonKey(name: 'category_icon') @Default('') String icon,
    String? blurhash,
    String? status,
    String? sort,
  }) = _CategoryDataDTO;

  const CategoryDataDTO._();

  factory CategoryDataDTO.fromJson(Map<String, dynamic> json) => _$CategoryDataDTOFromJson(json);

  CategoryModel toDomain() {
    return CategoryModel(
        id: id, name: name, picture: picture, status: status, blurhash: blurhash, icon: icon, sort: sort);
  }
}
