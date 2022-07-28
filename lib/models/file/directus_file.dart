import 'package:freezed_annotation/freezed_annotation.dart';

part 'directus_file.freezed.dart';

@freezed
class DirectusFile with _$DirectusFile {
  factory DirectusFile({
    String? id,
  }) = _DirectusFile;
}
