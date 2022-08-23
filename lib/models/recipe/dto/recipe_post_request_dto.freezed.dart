// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_post_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipePostRequestDTO _$RecipePostRequestDTOFromJson(Map<String, dynamic> json) {
  return _RecipePostRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$RecipePostRequestDTO {
  String? get difficulty => throw _privateConstructorUsedError;
  String? get blurhash => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  Map<String, dynamic> get categories => throw _privateConstructorUsedError;
  Map<String, dynamic> get tags => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredient_groups')
  Map<String, dynamic> get ingredientGroups =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'preparation_time')
  int? get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  String? get shortDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipePostRequestDTOCopyWith<RecipePostRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipePostRequestDTOCopyWith<$Res> {
  factory $RecipePostRequestDTOCopyWith(RecipePostRequestDTO value,
          $Res Function(RecipePostRequestDTO) then) =
      _$RecipePostRequestDTOCopyWithImpl<$Res>;
  $Res call(
      {String? difficulty,
      String? blurhash,
      String? picture,
      String instructions,
      Map<String, dynamic> categories,
      Map<String, dynamic> tags,
      String name,
      @JsonKey(name: 'ingredient_groups') Map<String, dynamic> ingredientGroups,
      @JsonKey(name: 'preparation_time') int? preparationTime,
      @JsonKey(name: 'short_description') String? shortDescription});
}

/// @nodoc
class _$RecipePostRequestDTOCopyWithImpl<$Res>
    implements $RecipePostRequestDTOCopyWith<$Res> {
  _$RecipePostRequestDTOCopyWithImpl(this._value, this._then);

  final RecipePostRequestDTO _value;
  // ignore: unused_field
  final $Res Function(RecipePostRequestDTO) _then;

  @override
  $Res call({
    Object? difficulty = freezed,
    Object? blurhash = freezed,
    Object? picture = freezed,
    Object? instructions = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? name = freezed,
    Object? ingredientGroups = freezed,
    Object? preparationTime = freezed,
    Object? shortDescription = freezed,
  }) {
    return _then(_value.copyWith(
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      blurhash: blurhash == freezed
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: instructions == freezed
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientGroups: ingredientGroups == freezed
          ? _value.ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipePostRequestDTOCopyWith<$Res>
    implements $RecipePostRequestDTOCopyWith<$Res> {
  factory _$$_RecipePostRequestDTOCopyWith(_$_RecipePostRequestDTO value,
          $Res Function(_$_RecipePostRequestDTO) then) =
      __$$_RecipePostRequestDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? difficulty,
      String? blurhash,
      String? picture,
      String instructions,
      Map<String, dynamic> categories,
      Map<String, dynamic> tags,
      String name,
      @JsonKey(name: 'ingredient_groups') Map<String, dynamic> ingredientGroups,
      @JsonKey(name: 'preparation_time') int? preparationTime,
      @JsonKey(name: 'short_description') String? shortDescription});
}

/// @nodoc
class __$$_RecipePostRequestDTOCopyWithImpl<$Res>
    extends _$RecipePostRequestDTOCopyWithImpl<$Res>
    implements _$$_RecipePostRequestDTOCopyWith<$Res> {
  __$$_RecipePostRequestDTOCopyWithImpl(_$_RecipePostRequestDTO _value,
      $Res Function(_$_RecipePostRequestDTO) _then)
      : super(_value, (v) => _then(v as _$_RecipePostRequestDTO));

  @override
  _$_RecipePostRequestDTO get _value => super._value as _$_RecipePostRequestDTO;

  @override
  $Res call({
    Object? difficulty = freezed,
    Object? blurhash = freezed,
    Object? picture = freezed,
    Object? instructions = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? name = freezed,
    Object? ingredientGroups = freezed,
    Object? preparationTime = freezed,
    Object? shortDescription = freezed,
  }) {
    return _then(_$_RecipePostRequestDTO(
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      blurhash: blurhash == freezed
          ? _value.blurhash
          : blurhash // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      instructions: instructions == freezed
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ingredientGroups: ingredientGroups == freezed
          ? _value._ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipePostRequestDTO extends _RecipePostRequestDTO {
  _$_RecipePostRequestDTO(
      {this.difficulty,
      this.blurhash,
      this.picture,
      required this.instructions,
      required final Map<String, dynamic> categories,
      required final Map<String, dynamic> tags,
      required this.name,
      @JsonKey(name: 'ingredient_groups')
          required final Map<String, dynamic> ingredientGroups,
      @JsonKey(name: 'preparation_time')
          this.preparationTime,
      @JsonKey(name: 'short_description')
          this.shortDescription})
      : _categories = categories,
        _tags = tags,
        _ingredientGroups = ingredientGroups,
        super._();

  factory _$_RecipePostRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RecipePostRequestDTOFromJson(json);

  @override
  final String? difficulty;
  @override
  final String? blurhash;
  @override
  final String? picture;
  @override
  final String instructions;
  final Map<String, dynamic> _categories;
  @override
  Map<String, dynamic> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  final Map<String, dynamic> _tags;
  @override
  Map<String, dynamic> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tags);
  }

  @override
  final String name;
  final Map<String, dynamic> _ingredientGroups;
  @override
  @JsonKey(name: 'ingredient_groups')
  Map<String, dynamic> get ingredientGroups {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ingredientGroups);
  }

  @override
  @JsonKey(name: 'preparation_time')
  final int? preparationTime;
  @override
  @JsonKey(name: 'short_description')
  final String? shortDescription;

  @override
  String toString() {
    return 'RecipePostRequestDTO(difficulty: $difficulty, blurhash: $blurhash, picture: $picture, instructions: $instructions, categories: $categories, tags: $tags, name: $name, ingredientGroups: $ingredientGroups, preparationTime: $preparationTime, shortDescription: $shortDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipePostRequestDTO &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other.blurhash, blurhash) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.instructions, instructions) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other._ingredientGroups, _ingredientGroups) &&
            const DeepCollectionEquality()
                .equals(other.preparationTime, preparationTime) &&
            const DeepCollectionEquality()
                .equals(other.shortDescription, shortDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(difficulty),
      const DeepCollectionEquality().hash(blurhash),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(instructions),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_ingredientGroups),
      const DeepCollectionEquality().hash(preparationTime),
      const DeepCollectionEquality().hash(shortDescription));

  @JsonKey(ignore: true)
  @override
  _$$_RecipePostRequestDTOCopyWith<_$_RecipePostRequestDTO> get copyWith =>
      __$$_RecipePostRequestDTOCopyWithImpl<_$_RecipePostRequestDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipePostRequestDTOToJson(
      this,
    );
  }
}

abstract class _RecipePostRequestDTO extends RecipePostRequestDTO {
  factory _RecipePostRequestDTO(
      {final String? difficulty,
      final String? blurhash,
      final String? picture,
      required final String instructions,
      required final Map<String, dynamic> categories,
      required final Map<String, dynamic> tags,
      required final String name,
      @JsonKey(name: 'ingredient_groups')
          required final Map<String, dynamic> ingredientGroups,
      @JsonKey(name: 'preparation_time')
          final int? preparationTime,
      @JsonKey(name: 'short_description')
          final String? shortDescription}) = _$_RecipePostRequestDTO;
  _RecipePostRequestDTO._() : super._();

  factory _RecipePostRequestDTO.fromJson(Map<String, dynamic> json) =
      _$_RecipePostRequestDTO.fromJson;

  @override
  String? get difficulty;
  @override
  String? get blurhash;
  @override
  String? get picture;
  @override
  String get instructions;
  @override
  Map<String, dynamic> get categories;
  @override
  Map<String, dynamic> get tags;
  @override
  String get name;
  @override
  @JsonKey(name: 'ingredient_groups')
  Map<String, dynamic> get ingredientGroups;
  @override
  @JsonKey(name: 'preparation_time')
  int? get preparationTime;
  @override
  @JsonKey(name: 'short_description')
  String? get shortDescription;
  @override
  @JsonKey(ignore: true)
  _$$_RecipePostRequestDTOCopyWith<_$_RecipePostRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
