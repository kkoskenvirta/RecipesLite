part of 'recipe_fetch_cubit.dart';

@immutable
abstract class RecipeFetchState extends Equatable {
  const RecipeFetchState();

  @override
  List<Object> get props => [];
}

class RecipeFetchInitial extends RecipeFetchState {}

class RecipeFetchLoading extends RecipeFetchState {}

class RecipeFetchLoaded extends RecipeFetchState {
  final List<RecipeModel> recipeList;
  RecipeFetchLoaded({required this.recipeList});

  @override
  List<Object> get props => [recipeList];
}

class RecipeFetchError extends RecipeFetchState {}
