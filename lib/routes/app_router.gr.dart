// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i11;

import '../models/category/category_model.dart' as _i13;
import '../models/recipe/recipe_model.dart' as _i12;
import '../views/category_recipes/single_category_page.dart' as _i8;
import '../views/login/login_page.dart' as _i1;
import '../views/main/categories/categories_screen.dart' as _i7;
import '../views/main/home_screen.dart' as _i6;
import '../views/main/main_page.dart' as _i2;
import '../views/profile/profile_recipe_view.dart' as _i10;
import '../views/profile/profile_screen.dart' as _i9;
import '../views/recipe_creator/recipe_creator.dart' as _i4;
import '../views/single_recipe/recipe_page.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    RecipeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RecipeRouteArgs>(
          orElse: () =>
              RecipeRouteArgs(recipeId: pathParams.getString('recipeId')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.RecipePage(
              key: args.key, recipeId: args.recipeId, recipe: args.recipe));
    },
    RecipeCreator.name: (routeData) {
      final args = routeData.argsAs<RecipeCreatorArgs>(
          orElse: () => const RecipeCreatorArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    RecipeEditor.name: (routeData) {
      final args = routeData.argsAs<RecipeEditorArgs>(
          orElse: () => const RecipeEditorArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    HomeRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    CategoriesRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    HomeScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeScreen());
    },
    CategoriesScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CategoriesScreen());
    },
    CategoryRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CategoryRouteArgs>(
          orElse: () => CategoryRouteArgs(
              categoryId: pathParams.getString('categoryId')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.SingleCategoryScreen(
              key: args.key,
              category: args.category,
              categoryId: args.categoryId));
    },
    ProfileScreen.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProfileScreen());
    },
    FavoritesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FavoritesRouteArgs>(
          orElse: () =>
              FavoritesRouteArgs(listMode: pathParams.getString('listMode')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.ProfileRecipeView(key: args.key, listMode: args.listMode));
    },
    OwnedRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OwnedRouteArgs>(
          orElse: () =>
              OwnedRouteArgs(listMode: pathParams.getString('listMode')));
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.ProfileRecipeView(key: args.key, listMode: args.listMode));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(MainRoute.name, path: '/main', children: [
          _i5.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MainRoute.name,
              children: [
                _i5.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeRouter.name)
              ]),
          _i5.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: MainRoute.name,
              children: [
                _i5.RouteConfig(CategoriesScreen.name,
                    path: '', parent: CategoriesRouter.name),
                _i5.RouteConfig(CategoryRoute.name,
                    path: ':categoryId', parent: CategoriesRouter.name)
              ]),
          _i5.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: MainRoute.name,
              children: [
                _i5.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRouter.name),
                _i5.RouteConfig(FavoritesRoute.name,
                    path: ':listMode', parent: ProfileRouter.name),
                _i5.RouteConfig(OwnedRoute.name,
                    path: ':listMode', parent: ProfileRouter.name)
              ])
        ]),
        _i5.RouteConfig(RecipeRoute.name, path: '/recipes/:recipeId'),
        _i5.RouteConfig(RecipeCreator.name, path: '/recipe-creator'),
        _i5.RouteConfig(RecipeEditor.name, path: '/recipe-editor')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.RecipePage]
class RecipeRoute extends _i5.PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute(
      {_i11.Key? key, required String recipeId, _i12.RecipeModel? recipe})
      : super(RecipeRoute.name,
            path: '/recipes/:recipeId',
            args: RecipeRouteArgs(key: key, recipeId: recipeId, recipe: recipe),
            rawPathParams: {'recipeId': recipeId});

  static const String name = 'RecipeRoute';
}

class RecipeRouteArgs {
  const RecipeRouteArgs({this.key, required this.recipeId, this.recipe});

  final _i11.Key? key;

  final String recipeId;

  final _i12.RecipeModel? recipe;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipeId: $recipeId, recipe: $recipe}';
  }
}

/// generated route for
/// [_i4.RecipeCreatorScreen]
class RecipeCreator extends _i5.PageRouteInfo<RecipeCreatorArgs> {
  RecipeCreator(
      {_i11.Key? key,
      String title = "New recipe",
      _i12.RecipeModel? editableRecipe})
      : super(RecipeCreator.name,
            path: '/recipe-creator',
            args: RecipeCreatorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeCreator';
}

class RecipeCreatorArgs {
  const RecipeCreatorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i11.Key? key;

  final String title;

  final _i12.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeCreatorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i4.RecipeCreatorScreen]
class RecipeEditor extends _i5.PageRouteInfo<RecipeEditorArgs> {
  RecipeEditor(
      {_i11.Key? key,
      String title = "New recipe",
      _i12.RecipeModel? editableRecipe})
      : super(RecipeEditor.name,
            path: '/recipe-editor',
            args: RecipeEditorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeEditor';
}

class RecipeEditorArgs {
  const RecipeEditorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i11.Key? key;

  final String title;

  final _i12.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeEditorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeRouter extends _i5.PageRouteInfo<void> {
  const HomeRouter({List<_i5.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class CategoriesRouter extends _i5.PageRouteInfo<void> {
  const CategoriesRouter({List<_i5.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class ProfileRouter extends _i5.PageRouteInfo<void> {
  const ProfileRouter({List<_i5.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i5.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i7.CategoriesScreen]
class CategoriesScreen extends _i5.PageRouteInfo<void> {
  const CategoriesScreen() : super(CategoriesScreen.name, path: '');

  static const String name = 'CategoriesScreen';
}

/// generated route for
/// [_i8.SingleCategoryScreen]
class CategoryRoute extends _i5.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute(
      {_i11.Key? key, _i13.CategoryModel? category, required String categoryId})
      : super(CategoryRoute.name,
            path: ':categoryId',
            args: CategoryRouteArgs(
                key: key, category: category, categoryId: categoryId),
            rawPathParams: {'categoryId': categoryId});

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs({this.key, this.category, required this.categoryId});

  final _i11.Key? key;

  final _i13.CategoryModel? category;

  final String categoryId;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, category: $category, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreen extends _i5.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i10.ProfileRecipeView]
class FavoritesRoute extends _i5.PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({_i11.Key? key, required String listMode})
      : super(FavoritesRoute.name,
            path: ':listMode',
            args: FavoritesRouteArgs(key: key, listMode: listMode),
            rawPathParams: {'listMode': listMode});

  static const String name = 'FavoritesRoute';
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({this.key, required this.listMode});

  final _i11.Key? key;

  final String listMode;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key, listMode: $listMode}';
  }
}

/// generated route for
/// [_i10.ProfileRecipeView]
class OwnedRoute extends _i5.PageRouteInfo<OwnedRouteArgs> {
  OwnedRoute({_i11.Key? key, required String listMode})
      : super(OwnedRoute.name,
            path: ':listMode',
            args: OwnedRouteArgs(key: key, listMode: listMode),
            rawPathParams: {'listMode': listMode});

  static const String name = 'OwnedRoute';
}

class OwnedRouteArgs {
  const OwnedRouteArgs({this.key, required this.listMode});

  final _i11.Key? key;

  final String listMode;

  @override
  String toString() {
    return 'OwnedRouteArgs{key: $key, listMode: $listMode}';
  }
}
