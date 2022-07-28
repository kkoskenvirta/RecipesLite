import 'package:freezed_annotation/freezed_annotation.dart';

part 'relation_details.freezed.dart';
part 'relation_details.g.dart';

@freezed
class RelationDetails with _$RelationDetails {
  factory RelationDetails({
    @Default([]) List<dynamic> create,
    @Default([]) List<dynamic> update,
    @Default([]) List<dynamic> delete,
  }) = _RelationDetails;

  const RelationDetails._();

  factory RelationDetails.fromJson(Map<String, dynamic> json) => _$RelationDetailsFromJson(json);
}
