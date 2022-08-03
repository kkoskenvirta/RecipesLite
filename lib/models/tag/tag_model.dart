import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

@freezed
class TagModel with _$TagModel {
  factory TagModel({
    required String id,
    required String name,
    int? relationId,
    String? status,
    String? sort,
  }) = _TagModel;

  const TagModel._();

  factory TagModel.fromJson(Map<String, dynamic> json) => _$TagModelFromJson(json);
}
