// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'created_recipe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreatedRecipeDTO _$CreatedRecipeDTOFromJson(Map<String, dynamic> json) {
  return _CreatedRecipeDTO.fromJson(json);
}

/// @nodoc
mixin _$CreatedRecipeDTO {
  String? get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String? get blurhash => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String get instructions => throw _privateConstructorUsedError;
  List<CategoryIdDTO> get categories => throw _privateConstructorUsedError;
  List<TagIdDTO>? get tags => throw _privateConstructorUsedError;
  List<IngredientGroupIdDTO> get ingredientGroups =>
      throw _privateConstructorUsedError;
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
  $CreatedRecipeDTOCopyWith<CreatedRecipeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedRecipeDTOCopyWith<$Res> {
  factory $CreatedRecipeDTOCopyWith(
          CreatedRecipeDTO value, $Res Function(CreatedRecipeDTO) then) =
      _$CreatedRecipeDTOCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? status,
      String? difficulty,
      double? rating,
      String? blurhash,
      String? picture,
      String instructions,
      List<CategoryIdDTO> categories,
      List<TagIdDTO>? tags,
      List<IngredientGroupIdDTO> ingredientGroups,
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
class _$CreatedRecipeDTOCopyWithImpl<$Res>
    implements $CreatedRecipeDTOCopyWith<$Res> {
  _$CreatedRecipeDTOCopyWithImpl(this._value, this._then);

  final CreatedRecipeDTO _value;
  // ignore: unused_field
  final $Res Function(CreatedRecipeDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? difficulty = freezed,
    Object? rating = freezed,
    Object? blurhash = freezed,
    Object? picture = freezed,
    Object? instructions = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? ingredientGroups = freezed,
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
              as List<CategoryIdDTO>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagIdDTO>?,
      ingredientGroups: ingredientGroups == freezed
          ? _value.ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroupIdDTO>,
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
abstract class _$$_CreatedRecipeDTOCopyWith<$Res>
    implements $CreatedRecipeDTOCopyWith<$Res> {
  factory _$$_CreatedRecipeDTOCopyWith(
          _$_CreatedRecipeDTO value, $Res Function(_$_CreatedRecipeDTO) then) =
      __$$_CreatedRecipeDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? status,
      String? difficulty,
      double? rating,
      String? blurhash,
      String? picture,
      String instructions,
      List<CategoryIdDTO> categories,
      List<TagIdDTO>? tags,
      List<IngredientGroupIdDTO> ingredientGroups,
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
class __$$_CreatedRecipeDTOCopyWithImpl<$Res>
    extends _$CreatedRecipeDTOCopyWithImpl<$Res>
    implements _$$_CreatedRecipeDTOCopyWith<$Res> {
  __$$_CreatedRecipeDTOCopyWithImpl(
      _$_CreatedRecipeDTO _value, $Res Function(_$_CreatedRecipeDTO) _then)
      : super(_value, (v) => _then(v as _$_CreatedRecipeDTO));

  @override
  _$_CreatedRecipeDTO get _value => super._value as _$_CreatedRecipeDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? difficulty = freezed,
    Object? rating = freezed,
    Object? blurhash = freezed,
    Object? picture = freezed,
    Object? instructions = freezed,
    Object? categories = freezed,
    Object? tags = freezed,
    Object? ingredientGroups = freezed,
    Object? name = freezed,
    Object? featured = freezed,
    Object? preparationTime = freezed,
    Object? shortDescription = freezed,
    Object? commentCount = freezed,
    Object? userCreated = freezed,
    Object? dateCreated = freezed,
    Object? dateUpdated = freezed,
  }) {
    return _then(_$_CreatedRecipeDTO(
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
              as List<CategoryIdDTO>,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagIdDTO>?,
      ingredientGroups: ingredientGroups == freezed
          ? _value._ingredientGroups
          : ingredientGroups // ignore: cast_nullable_to_non_nullable
              as List<IngredientGroupIdDTO>,
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
class _$_CreatedRecipeDTO extends _CreatedRecipeDTO {
  _$_CreatedRecipeDTO(
      {this.id,
      this.status,
      this.difficulty,
      this.rating,
      this.blurhash,
      this.picture,
      this.instructions = '',
      required final List<CategoryIdDTO> categories,
      required final List<TagIdDTO>? tags,
      required final List<IngredientGroupIdDTO> ingredientGroups,
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
        _ingredientGroups = ingredientGroups,
        super._();

  factory _$_CreatedRecipeDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CreatedRecipeDTOFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  final String? difficulty;
  @override
  final double? rating;
  @override
  final String? blurhash;
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

  final List<IngredientGroupIdDTO> _ingredientGroups;
  @override
  List<IngredientGroupIdDTO> get ingredientGroups {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientGroups);
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
    return 'CreatedRecipeDTO(id: $id, status: $status, difficulty: $difficulty, rating: $rating, blurhash: $blurhash, picture: $picture, instructions: $instructions, categories: $categories, tags: $tags, ingredientGroups: $ingredientGroups, name: $name, featured: $featured, preparationTime: $preparationTime, shortDescription: $shortDescription, commentCount: $commentCount, userCreated: $userCreated, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatedRecipeDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.blurhash, blurhash) &&
            const DeepCollectionEquality().equals(other.picture, picture) &&
            const DeepCollectionEquality()
                .equals(other.instructions, instructions) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._ingredientGroups, _ingredientGroups) &&
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
      const DeepCollectionEquality().hash(blurhash),
      const DeepCollectionEquality().hash(picture),
      const DeepCollectionEquality().hash(instructions),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_ingredientGroups),
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
  _$$_CreatedRecipeDTOCopyWith<_$_CreatedRecipeDTO> get copyWith =>
      __$$_CreatedRecipeDTOCopyWithImpl<_$_CreatedRecipeDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatedRecipeDTOToJson(
      this,
    );
  }
}

abstract class _CreatedRecipeDTO extends CreatedRecipeDTO {
  factory _CreatedRecipeDTO(
          {final String? id,
          final String? status,
          final String? difficulty,
          final double? rating,
          final String? blurhash,
          final String? picture,
          final String instructions,
          required final List<CategoryIdDTO> categories,
          required final List<TagIdDTO>? tags,
          required final List<IngredientGroupIdDTO> ingredientGroups,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Featured') final bool? featured,
          @JsonKey(name: 'preparation_time') final int? preparationTime,
          @JsonKey(name: 'short_description') final String? shortDescription,
          @JsonKey(name: 'comment_count') final int? commentCount,
          @JsonKey(name: 'user_created') final String? userCreated,
          @JsonKey(name: 'date_created') final DateTime? dateCreated,
          @JsonKey(name: 'date_updated') final dynamic dateUpdated}) =
      _$_CreatedRecipeDTO;
  _CreatedRecipeDTO._() : super._();

  factory _CreatedRecipeDTO.fromJson(Map<String, dynamic> json) =
      _$_CreatedRecipeDTO.fromJson;

  @override
  String? get id;
  @override
  String? get status;
  @override
  String? get difficulty;
  @override
  double? get rating;
  @override
  String? get blurhash;
  @override
  String? get picture;
  @override
  String get instructions;
  @override
  List<CategoryIdDTO> get categories;
  @override
  List<TagIdDTO>? get tags;
  @override
  List<IngredientGroupIdDTO> get ingredientGroups;
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
  _$$_CreatedRecipeDTOCopyWith<_$_CreatedRecipeDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
