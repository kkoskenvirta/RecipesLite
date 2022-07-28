part of 'form_data_cubit.dart';

enum FormDataStateStatus { initial, loading, loaded, error }

enum DirectusRequestStatus { initial, loading, loaded, error }

enum BlurHashStatus { initial, loading, loaded, error }

@freezed
class FormDataState with _$FormDataState {
  const factory FormDataState({
    required FormDataStateStatus status,
    required DirectusRequestStatus requestStatus,
    required BlurHashStatus blurHashStatus,
    required bool featured,
    required String instructions,
    required List<IncredientModel> incredients,
    required List<CategoryModel> categories,
    required List<TagModel> tags,
    required RecipeModel recipe,
    int? preparationTime,
    String? name,
    String? shortDescription,
    String? difficulty,
    File? image,
    String? blurHash,
  }) = _FormDataState;

  factory FormDataState.initial() {
    return FormDataState(
      status: FormDataStateStatus.initial,
      requestStatus: DirectusRequestStatus.initial,
      recipe: RecipeModel(),
      featured: false,
      preparationTime: null,
      instructions: "",
      incredients: [],
      categories: [],
      tags: [],
      name: null,
      shortDescription: null,
      difficulty: "easy",
      image: null,
      blurHash: "",
      blurHashStatus: BlurHashStatus.initial,
    );
  }
}
