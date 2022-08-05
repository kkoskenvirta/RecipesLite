import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/main/categories/categories_screen.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_recipe_view.dart';
import 'package:flutter_e_commerce/views/profile/profile_screen.dart';
import 'package:flutter_e_commerce/views/category_recipes/single_category_page.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:get/get.dart';

enum Routes {
  login('/'),
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

class RecipeListArgs {
  final String title;
  final ListMode mode;
  RecipeListArgs(this.title, this.mode);
}

class RecipeEditorArgs {
  final String title;
  final RecipeModel recipe;
  RecipeEditorArgs(this.title, this.recipe);
}

class GetXRoutes {
  final List<GetPage> routes = [
    GetPage(name: Routes.login.name, page: () => const LoginPage()),
    GetPage(name: Routes.main.name, page: () => const MainPage()),
    GetPage(name: Routes.recipe.name, page: () => const RecipePage()),
    GetPage(name: Routes.favorites.name, page: () => const ProfileRecipeView()),
    GetPage(name: Routes.ownRecipes.name, page: () => const ProfileRecipeView()),
    GetPage(name: Routes.categories.name, page: () => const CategoriesScreen()),
    GetPage(name: Routes.category.name, page: () => SingleCategoryScreen()),
    GetPage(name: Routes.recipeCreator.name, page: () => const RecipeCreatorScreen()),
    GetPage(name: Routes.recipeEditor.name, page: () => const RecipeCreatorScreen()),
  ];
  GetXRoutes();
}
