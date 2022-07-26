part of 'form_fetch_cubit.dart';

enum FormFetchStateStatus { initial, loading, loaded, error }

@freezed
class FormFetchState with _$FormFetchState {
  const factory FormFetchState({
    required FormFetchStateStatus status,
    required List<CategoryModel> categories,
    required List<TagModel> tags,
  }) = _FormFetchState;

  factory FormFetchState.initial() {
    return const FormFetchState(
      status: FormFetchStateStatus.initial,
      categories: [],
      tags: [],
    );
  }
}
