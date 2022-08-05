import 'package:auto_route/auto_route.dart';
import 'package:flutter_e_commerce/views/category_recipes/single_category_page.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/main/categories/categories_screen.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_recipe_view.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: LoginPage, path: '/login', initial: true),
    MaterialRoute(page: MainPage, path: '/main'),
    MaterialRoute(page: RecipePage, path: '/recipe'),
    MaterialRoute(name: "favorites", page: ProfileRecipeView, path: '/main/profile/favorites'),
    MaterialRoute(name: "owned", page: ProfileRecipeView, path: '/main/profile/recipes'),
    MaterialRoute(page: CategoriesScreen, path: '/main/categories'),
    MaterialRoute(page: SingleCategoryScreen, path: '/main/category'),
    MaterialRoute(name: "recipeCreator", page: RecipeCreatorScreen, path: '/recipe-creator'),
    MaterialRoute(name: "recipeEditor", page: RecipeCreatorScreen, path: '/recipe-editor'),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
