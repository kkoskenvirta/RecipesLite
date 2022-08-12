import 'package:auto_route/auto_route.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/views/category_recipes/single_category_page.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/main/categories/categories_screen.dart';
import 'package:flutter_e_commerce/views/main/home_screen.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_recipe_view.dart';
import 'package:flutter_e_commerce/views/profile/profile_screen.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/search/search_page.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: LoginPage, path: '/login', initial: true),
    AutoRoute(page: MainPage, path: '/main', children: [
      MaterialRoute(
        name: "HomeRouter",
        page: EmptyRouterPage,
        path: 'home',
        children: [
          MaterialRoute(path: '', page: HomeScreen),
        ],
      ),
      MaterialRoute(
        name: "CategoriesRouter",
        page: EmptyRouterPage,
        path: 'categories',
        children: [
          MaterialRoute(path: '', page: CategoriesScreen),
          MaterialRoute(name: "CategoryRoute", path: ':categoryId', page: SingleCategoryScreen),
        ],
      ),
      MaterialRoute(
        name: "ProfileRouter",
        page: EmptyRouterPage,
        path: 'profile',
        children: [
          MaterialRoute(path: '', page: ProfileScreen),
          MaterialRoute(name: "FavoritesRoute", path: ':listMode', page: ProfileRecipeView),
          MaterialRoute(name: "OwnedRoute", path: ':listMode', page: ProfileRecipeView),
        ],
      ),
    ]),
    MaterialRoute(path: '/recipes/:recipeId', page: RecipePage),
    MaterialRoute<RecipeModel>(name: "RecipeCreator", page: RecipeCreatorScreen, path: '/recipe-creator'),
    MaterialRoute<RecipeModel>(name: "RecipeEditor", page: RecipeCreatorScreen, path: '/recipe-editor'),
    CustomRoute(
      page: SearchPage,
      path: '/search',
      transitionsBuilder: TransitionsBuilders.slideRight,
      durationInMilliseconds: 250,
    ),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
