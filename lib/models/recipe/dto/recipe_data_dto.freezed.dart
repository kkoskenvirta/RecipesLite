// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeDataDTO _$RecipeDataDTOFromJson(Map<String, dynamic> json) {
  return _RecipeDataDTO.fromJson(json);
}

/// @nodoc
mixin _$RecipeDataDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  List<CategoryIdDTO> get categories => throw _privateConstructorUsedError;
  List<TagIdDTO>? get tags => throw _privateConstructorUsedError;
  List<IncredientIdDTO> get incredients => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Featured')
  bool? get featured => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparation_time')
  int? get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  String? get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int? get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_created')
  String? get userCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_created')
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_updated')
  dynamic get dateUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeDataDTOCopyWith<RecipeDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDataDTOCopyWith<$Res> {
  factory $RecipeDataDTOCopyWith(
          RecipeDataDTO value, $Res Function(RecipeDataDTO) then) =
      _$RecipeDataDTOCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? status,
      String? difficulty,
      double? rating,
      String? picture,
      String instructions,
      List<CategoryIdDTO> categories,
      List<TagIdDTO>? tags,
      List<IncredientIdDTO> incredients,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Featured') bool? featured,
      @JsonKey(name: 'preparation_time') int? preparationTime,
      @JsonKey(name: 'short_description') String? shortDescription,
      @JsonKey(name: 'comment_count') int? commentCount,
      @JsonKey(name: 'user_created') String? userCreated,
      @JsonKey(name: 'date_created') DateTime? dateCreated,
      @JsonKey(name: 'date_updated') dynamic dateUpdated});
}

/// @nodoc
class _$RecipeDataDTOCopyWithImpl<$Res>
    implements $RecipeDataDTOCopyWith<$Res> {
  _$RecipeDataDTOCopyWithImpl(this._value, this._then);

  final RecipeDataDTO _value;
  // ignore: unused_field
  final $Res Function(RecipeDataDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? difficulty = freezed,
    Object? rating = freezed,
    Object? picture = freezed,
    Object? instructions = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? incredients = freezed,
    Object? name = freezed,
    Object? featured = freezed,
    Object? preparationTime = freezed,
    Object? shortDescription = freezed,
    Object? commentCount = freezed,
    Object? userCreated = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
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
              as List<CategoryIdDTO>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagIdDTO>?,
      incredients: incredients == freezed
          ? _value.incredients
          : incredients // ignore: cast_nullable_to_non_nullable
              as List<IncredientIdDTO>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: featured == freezed
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      userCreated: userCreated == freezed
          ? _value.userCreated
          : userCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: dateUpdated == freezed
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeDataDTOCopyWith<$Res>
    implements $RecipeDataDTOCopyWith<$Res> {
  factory _$$_RecipeDataDTOCopyWith(
          _$_RecipeDataDTO value, $Res Function(_$_RecipeDataDTO) then) =
      __$$_RecipeDataDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? status,
      String? difficulty,
      double? rating,
      String? picture,
      String instructions,
      List<CategoryIdDTO> categories,
      List<TagIdDTO>? tags,
      List<IncredientIdDTO> incredients,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Featured') bool? featured,
      @JsonKey(name: 'preparation_time') int? preparationTime,
      @JsonKey(name: 'short_description') String? shortDescription,
      @JsonKey(name: 'comment_count') int? commentCount,
      @JsonKey(name: 'user_created') String? userCreated,
      @JsonKey(name: 'date_created') DateTime? dateCreated,
      @JsonKey(name: 'date_updated') dynamic dateUpdated});
}

/// @nodoc
class __$$_RecipeDataDTOCopyWithImpl<$Res>
    extends _$RecipeDataDTOCopyWithImpl<$Res>
    implements _$$_RecipeDataDTOCopyWith<$Res> {
  __$$_RecipeDataDTOCopyWithImpl(
      _$_RecipeDataDTO _value, $Res Function(_$_RecipeDataDTO) _then)
      : super(_value, (v) => _then(v as _$_RecipeDataDTO));

  @override
  _$_RecipeDataDTO get _value => super._value as _$_RecipeDataDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? difficulty = freezed,
    Object? rating = freezed,
    Object? picture = freezed,
    Object? instructions = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? incredients = freezed,
    Object? name = freezed,
    Object? featured = freezed,
    Object? preparationTime = freezed,
    Object? shortDescription = freezed,
    Object? commentCount = freezed,
    Object? userCreated = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_$_RecipeDataDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
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
              as List<CategoryIdDTO>,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagIdDTO>?,
      incredients: incredients == freezed
          ? _value._incredients
          : incredients // ignore: cast_nullable_to_non_nullable
              as List<IncredientIdDTO>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: featured == freezed
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      shortDescription: shortDescription == freezed
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      userCreated: userCreated == freezed
          ? _value.userCreated
          : userCreated // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateUpdated: dateUpdated == freezed
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeDataDTO extends _RecipeDataDTO {
  _$_RecipeDataDTO(
      {this.id,
      this.status,
      this.difficulty,
      this.rating,
      this.picture,
      this.instructions = '',
      required final List<CategoryIdDTO> categories,
      required final List<TagIdDTO>? tags,
      required final List<IncredientIdDTO> incredients,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'Featured') this.featured,
      @JsonKey(name: 'preparation_time') this.preparationTime,
      @JsonKey(name: 'short_description') this.shortDescription,
      @JsonKey(name: 'comment_count') this.commentCount,
      @JsonKey(name: 'user_created') this.userCreated,
      @JsonKey(name: 'date_created') this.dateCreated,
      @JsonKey(name: 'date_updated') this.dateUpdated})
      : _categories = categories,
        _tags = tags,
        _incredients = incredients,
        super._();

  factory _$_RecipeDataDTO.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeDataDTOFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? difficulty;
  @override
  final double? rating;
  @override
  final String? picture;
  @override
  @JsonKey()
  final String instructions;
  final List<CategoryIdDTO> _categories;
  @override
  List<CategoryIdDTO> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<TagIdDTO>? _tags;
  @override
  List<TagIdDTO>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IncredientIdDTO> _incredients;
  @override
  List<IncredientIdDTO> get incredients {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incredients);
  }

  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'Featured')
  final bool? featured;
  @override
  @JsonKey(name: 'preparation_time')
  final int? preparationTime;
  @override
  @JsonKey(name: 'short_description')
  final String? shortDescription;
  @override
  @JsonKey(name: 'comment_count')
  final int? commentCount;
  @override
  @JsonKey(name: 'user_created')
  final String? userCreated;
  @override
  @JsonKey(name: 'date_created')
  final DateTime? dateCreated;
  @override
  @JsonKey(name: 'date_updated')
  final dynamic dateUpdated;

  @override
  String toString() {
    return 'RecipeDataDTO(id: $id, status: $status, difficulty: $difficulty, rating: $rating, picture: $picture, instructions: $instructions, categories: $categories, tags: $tags, incredients: $incredients, name: $name, featured: $featured, preparationTime: $preparationTime, shortDescription: $shortDescription, commentCount: $commentCount, userCreated: $userCreated, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeDataDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.instructions, instructions) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._incredients, _incredients) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.featured, featured) &&
            const DeepCollectionEquality()
                .equals(other.preparationTime, preparationTime) &&
            const DeepCollectionEquality()
                .equals(other.shortDescription, shortDescription) &&
            const DeepCollectionEquality()
                .equals(other.commentCount, commentCount) &&
            const DeepCollectionEquality()
                .equals(other.userCreated, userCreated) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality()
                .equals(other.dateUpdated, dateUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(difficulty),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(instructions),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_incredients),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(featured),
      const DeepCollectionEquality().hash(preparationTime),
      const DeepCollectionEquality().hash(shortDescription),
      const DeepCollectionEquality().hash(commentCount),
      const DeepCollectionEquality().hash(userCreated),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(dateUpdated));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeDataDTOCopyWith<_$_RecipeDataDTO> get copyWith =>
      __$$_RecipeDataDTOCopyWithImpl<_$_RecipeDataDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeDataDTOToJson(
      this,
    );
  }
}

abstract class _RecipeDataDTO extends RecipeDataDTO {
  factory _RecipeDataDTO(
          {final String? id,
          final String? status,
          final String? difficulty,
          final double? rating,
          final String? picture,
          final String instructions,
          required final List<CategoryIdDTO> categories,
          required final List<TagIdDTO>? tags,
          required final List<IncredientIdDTO> incredients,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Featured') final bool? featured,
          @JsonKey(name: 'preparation_time') final int? preparationTime,
          @JsonKey(name: 'short_description') final String? shortDescription,
          @JsonKey(name: 'comment_count') final int? commentCount,
          @JsonKey(name: 'user_created') final String? userCreated,
          @JsonKey(name: 'date_created') final DateTime? dateCreated,
          @JsonKey(name: 'date_updated') final dynamic dateUpdated}) =
      _$_RecipeDataDTO;
  _RecipeDataDTO._() : super._();

  factory _RecipeDataDTO.fromJson(Map<String, dynamic> json) =
      _$_RecipeDataDTO.fromJson;

  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get difficulty;
  @override
  double? get rating;
  @override
  String? get picture;
  @override
  String get instructions;
  @override
  List<CategoryIdDTO> get categories;
  @override
  List<TagIdDTO>? get tags;
  @override
  List<IncredientIdDTO> get incredients;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'Featured')
  bool? get featured;
  @override
  @JsonKey(name: 'preparation_time')
  int? get preparationTime;
  @override
  @JsonKey(name: 'short_description')
  String? get shortDescription;
  @override
  @JsonKey(name: 'comment_count')
  int? get commentCount;
  @override
  @JsonKey(name: 'user_created')
  String? get userCreated;
  @override
  @JsonKey(name: 'date_created')
  DateTime? get dateCreated;
  @override
  @JsonKey(name: 'date_updated')
  dynamic get dateUpdated;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeDataDTOCopyWith<_$_RecipeDataDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
