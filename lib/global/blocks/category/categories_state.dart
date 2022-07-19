part of 'categories_cubit.dart';

enum CategoriesStateStatus { initial, loading, loaded, error }

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    required CategoriesStateStatus status,
    required List<CategoryModel> categories,
  }) = _CategoriesState;

  factory CategoriesState.initial() {
    return const CategoriesState(
      status: CategoriesStateStatus.initial,
      categories: [],
    );
  }
}
