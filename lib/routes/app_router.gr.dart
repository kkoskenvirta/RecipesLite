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

import '../views/category_recipes/single_category_page.dart' as _i6;
import '../views/login/login_page.dart' as _i1;
import '../views/main/categories/categories_screen.dart' as _i5;
import '../views/main/main_page.dart' as _i2;
import '../views/profile/profile_recipe_view.dart' as _i4;
import '../views/recipe_creator/recipe_creator.dart' as _i7;
import '../views/single_recipe/recipe_page.dart' as _i3;

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
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RecipePage());
    },
    Favorites.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfileRecipeView());
    },
    Owned.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProfileRecipeView());
    },
    CategoriesScreen.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CategoriesScreen());
    },
    SingleCategoryScreen.name: (routeData) {
      final args = routeData.argsAs<SingleCategoryScreenArgs>(
          orElse: () => const SingleCategoryScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.SingleCategoryScreen(key: args.key));
    },
    RecipeCreator.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RecipeCreatorScreen());
    },
    RecipeEditor.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RecipeCreatorScreen());
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
class RecipeRoute extends _i8.PageRouteInfo<void> {
  const RecipeRoute() : super(RecipeRoute.name, path: '/recipe');

  static const String name = 'RecipeRoute';
}

/// generated route for
/// [_i4.ProfileRecipeView]
class Favorites extends _i8.PageRouteInfo<void> {
  const Favorites() : super(Favorites.name, path: '/main/profile/favorites');

  static const String name = 'Favorites';
}

/// generated route for
/// [_i4.ProfileRecipeView]
class Owned extends _i8.PageRouteInfo<void> {
  const Owned() : super(Owned.name, path: '/main/profile/recipes');

  static const String name = 'Owned';
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
  SingleCategoryScreen({_i9.Key? key})
      : super(SingleCategoryScreen.name,
            path: '/main/category', args: SingleCategoryScreenArgs(key: key));

  static const String name = 'SingleCategoryScreen';
}

class SingleCategoryScreenArgs {
  const SingleCategoryScreenArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'SingleCategoryScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RecipeCreatorScreen]
class RecipeCreator extends _i8.PageRouteInfo<void> {
  const RecipeCreator() : super(RecipeCreator.name, path: '/recipe-creator');

  static const String name = 'RecipeCreator';
}

/// generated route for
/// [_i7.RecipeCreatorScreen]
class RecipeEditor extends _i8.PageRouteInfo<void> {
  const RecipeEditor() : super(RecipeEditor.name, path: '/recipe-editor');

  static const String name = 'RecipeEditor';
}
