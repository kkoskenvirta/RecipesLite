part of 'form_data_cubit.dart';

enum FormDataStateStatus { initial, loading, loaded, error }

@freezed
class FormDataState with _$FormDataState {
  const factory FormDataState({
    required FormDataStateStatus status,
    required bool featured,
    required int preparationTime,
    required String instructions,
    required List<IncredientModel> incredients,
    required List<CategoryModel> categories,
    required List<CategoryModel> tags,
    RecipeModel? recipe,
    String? name,
    String? shortDescription,
    String? difficulty,
    File? image,
  }) = _FormDataState;

  factory FormDataState.initial() {
    return FormDataState(
      status: FormDataStateStatus.initial,
      recipe: null,
      featured: false,
      preparationTime: 30,
      instructions: "",
      incredients: [IncredientModel.create()],
      categories: [],
      tags: [],
      name: null,
      shortDescription: null,
      difficulty: null,
      image: null,
    );
  }
}
