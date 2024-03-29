part of 'form_data_cubit.dart';

enum FormDataStateStatus { initial, loading, loaded, error }

enum DirectusRequestStatus { initial, loading, loaded, error }

enum BlurHashStatus { initial, loading, loaded, error }

@freezed
class FormDataState with _$FormDataState {
  const factory FormDataState({
    bool? editMode,
    required FormDataStateStatus status,
    required DirectusRequestStatus requestStatus,
    required DirectusRequestStatus recipeFetchStatus,
    required BlurHashStatus blurHashStatus,
    required bool featured,
    required String instructions,
    required List<IngredientModel> ingredients,
    required List<IngredientGroupModel> ingredientGroups,
    required List<CategoryModel> categories,
    required List<TagModel> tags,
    required RecipeModel recipe,
    String? id,
    int? preparationTime,
    String? name,
    String? shortDescription,
    String? difficulty,
    String? picture,
    File? image,
    String? blurHash,
  }) = _FormDataState;

  factory FormDataState.initial() {
    return FormDataState(
      editMode: false,
      status: FormDataStateStatus.initial,
      requestStatus: DirectusRequestStatus.initial,
      recipeFetchStatus: DirectusRequestStatus.initial,
      recipe: RecipeModel(),
      featured: false,
      preparationTime: null,
      id: null,
      instructions: "",
      ingredients: [],
      ingredientGroups: [IngredientGroupModel(name: "Ingredients", ingredients: [])],
      categories: [],
      tags: [],
      name: null,
      shortDescription: null,
      difficulty: "Easy",
      picture: null,
      image: null,
      blurHash: "",
      blurHashStatus: BlurHashStatus.initial,
    );
  }
}
