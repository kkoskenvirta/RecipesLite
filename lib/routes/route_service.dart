enum Routes {
  login('/login'),
  recipe('/main/recipe'),
  main('/main'),
  profile('/main/profile'),
  favorites('/main/profile/favorites'),
  ownRecipes('/main/profile/recipes'),
  category('/main/category'),
  categories('/main/categories'),
  recipeCreator('/recipeCreator'),
  recipeEditor('/recipeEditor');

  const Routes(this.name);
  final String name;
}

enum ListMode {
  favorites,
  owned,
}
