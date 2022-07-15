part of 'recipe_search_cubit.dart';

@immutable
abstract class RecipeSearchState extends Equatable {
  const RecipeSearchState();

  @override
  List<Object> get props => [];
}

class RecipeSearchInitial extends RecipeSearchState {}

class RecipeSearchLoading extends RecipeSearchState {}

class RecipeSearchLoaded extends RecipeSearchState {
  final List<RecipeModel> recipeList;
  RecipeSearchLoaded({required this.recipeList});

  @override
  List<Object> get props => [recipeList];
}

class RecipeSearchError extends RecipeSearchState {}
