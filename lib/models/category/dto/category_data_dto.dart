import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data_dto.freezed.dart';
part 'category_data_dto.g.dart';

@freezed
class CategoryDataDTO with _$CategoryDataDTO {
  factory CategoryDataDTO({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'picture') @Default('') String picture,
    @JsonKey(name: 'recipes_count') String? recipesCount,
    String? blurhash,
    String? status,
    String? sort,
  }) = _CategoryDataDTO;

  const CategoryDataDTO._();

  factory CategoryDataDTO.fromJson(Map<String, dynamic> json) => _$CategoryDataDTOFromJson(json);

  CategoryModel toDomain() {
    return CategoryModel(
      id: id,
      name: name,
      picture: picture,
      status: status,
      blurhash: blurhash,
      sort: sort,
      recipesCount: recipesCount,
    );
  }
}
