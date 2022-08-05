// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../models/category/category_model.dart' as _i12;
import '../models/recipe/recipe_model.dart' as _i10;
import '../views/category_recipes/single_category_page.dart' as _i6;
import '../views/login/login_page.dart' as _i1;
import '../views/main/categories/categories_screen.dart' as _i5;
import '../views/main/main_page.dart' as _i2;
import '../views/profile/profile_recipe_view.dart' as _i4;
import '../views/recipe_creator/recipe_creator.dart' as _i7;
import '../views/single_recipe/recipe_page.dart' as _i3;
import 'route_service.dart' as _i11;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    MainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    RecipeRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.RecipePage(key: args.key, recipe: args.recipe));
    },
    Favorites.name: (routeData) {
      final args = routeData.argsAs<FavoritesArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ProfileRecipeView(
              key: args.key, title: args.title, mode: args.mode));
    },
    Owned.name: (routeData) {
      final args = routeData.argsAs<OwnedArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ProfileRecipeView(
              key: args.key, title: args.title, mode: args.mode));
    },
    CategoriesScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CategoriesScreen());
    },
    SingleCategoryScreen.name: (routeData) {
      final args = routeData.argsAs<SingleCategoryScreenArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i6.SingleCategoryScreen(key: args.key, category: args.category));
    },
    RecipeCreator.name: (routeData) {
      final args = routeData.argsAs<RecipeCreatorArgs>(
          orElse: () => const RecipeCreatorArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    RecipeEditor.name: (routeData) {
      final args = routeData.argsAs<RecipeEditorArgs>(
          orElse: () => const RecipeEditorArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i8.RouteConfig(LoginRoute.name, path: '/login'),
        _i8.RouteConfig(MainRoute.name, path: '/main'),
        _i8.RouteConfig(RecipeRoute.name, path: '/recipe'),
        _i8.RouteConfig(Favorites.name, path: '/main/profile/favorites'),
        _i8.RouteConfig(Owned.name, path: '/main/profile/recipes'),
        _i8.RouteConfig(CategoriesScreen.name, path: '/main/categories'),
        _i8.RouteConfig(SingleCategoryScreen.name, path: '/main/category'),
        _i8.RouteConfig(RecipeCreator.name, path: '/recipe-creator'),
        _i8.RouteConfig(RecipeEditor.name, path: '/recipe-editor')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/main');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.RecipePage]
class RecipeRoute extends _i8.PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute({_i9.Key? key, required _i10.RecipeModel recipe})
      : super(RecipeRoute.name,
            path: '/recipe', args: RecipeRouteArgs(key: key, recipe: recipe));

  static const String name = 'RecipeRoute';
}

class RecipeRouteArgs {
  const RecipeRouteArgs({this.key, required this.recipe});

  final _i9.Key? key;

  final _i10.RecipeModel recipe;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipe: $recipe}';
  }
}

/// generated route for
/// [_i4.ProfileRecipeView]
class Favorites extends _i8.PageRouteInfo<FavoritesArgs> {
  Favorites({_i9.Key? key, required String title, required _i11.ListMode mode})
      : super(Favorites.name,
            path: '/main/profile/favorites',
            args: FavoritesArgs(key: key, title: title, mode: mode));

  static const String name = 'Favorites';
}

class FavoritesArgs {
  const FavoritesArgs({this.key, required this.title, required this.mode});

  final _i9.Key? key;

  final String title;

  final _i11.ListMode mode;

  @override
  String toString() {
    return 'FavoritesArgs{key: $key, title: $title, mode: $mode}';
  }
}

/// generated route for
/// [_i4.ProfileRecipeView]
class Owned extends _i8.PageRouteInfo<OwnedArgs> {
  Owned({_i9.Key? key, required String title, required _i11.ListMode mode})
      : super(Owned.name,
            path: '/main/profile/recipes',
            args: OwnedArgs(key: key, title: title, mode: mode));

  static const String name = 'Owned';
}

class OwnedArgs {
  const OwnedArgs({this.key, required this.title, required this.mode});

  final _i9.Key? key;

  final String title;

  final _i11.ListMode mode;

  @override
  String toString() {
    return 'OwnedArgs{key: $key, title: $title, mode: $mode}';
  }
}

/// generated route for
/// [_i5.CategoriesScreen]
class CategoriesScreen extends _i8.PageRouteInfo<void> {
  const CategoriesScreen()
      : super(CategoriesScreen.name, path: '/main/categories');

  static const String name = 'CategoriesScreen';
}

/// generated route for
/// [_i6.SingleCategoryScreen]
class SingleCategoryScreen extends _i8.PageRouteInfo<SingleCategoryScreenArgs> {
  SingleCategoryScreen({_i9.Key? key, required _i12.CategoryModel category})
      : super(SingleCategoryScreen.name,
            path: '/main/category',
            args: SingleCategoryScreenArgs(key: key, category: category));

  static const String name = 'SingleCategoryScreen';
}

class SingleCategoryScreenArgs {
  const SingleCategoryScreenArgs({this.key, required this.category});

  final _i9.Key? key;

  final _i12.CategoryModel category;

  @override
  String toString() {
    return 'SingleCategoryScreenArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i7.RecipeCreatorScreen]
class RecipeCreator extends _i8.PageRouteInfo<RecipeCreatorArgs> {
  RecipeCreator(
      {_i9.Key? key,
      String title = "New recipe",
      _i10.RecipeModel? editableRecipe})
      : super(RecipeCreator.name,
            path: '/recipe-creator',
            args: RecipeCreatorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeCreator';
}

class RecipeCreatorArgs {
  const RecipeCreatorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i9.Key? key;

  final String title;

  final _i10.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeCreatorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i7.RecipeCreatorScreen]
class RecipeEditor extends _i8.PageRouteInfo<RecipeEditorArgs> {
  RecipeEditor(
      {_i9.Key? key,
      String title = "New recipe",
      _i10.RecipeModel? editableRecipe})
      : super(RecipeEditor.name,
            path: '/recipe-editor',
            args: RecipeEditorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeEditor';
}

class RecipeEditorArgs {
  const RecipeEditorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i9.Key? key;

  final String title;

  final _i10.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeEditorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}
