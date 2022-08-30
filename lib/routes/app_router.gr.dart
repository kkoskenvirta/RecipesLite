// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i12;

import '../models/category/category_model.dart' as _i14;
import '../models/recipe/recipe_model.dart' as _i13;
import '../views/categories/categories_page.dart' as _i9;
import '../views/login/login_page.dart' as _i1;
import '../views/main/home_page.dart' as _i7;
import '../views/main/main_page.dart' as _i3;
import '../views/profile/profile_page.dart' as _i10;
import '../views/profile/profile_recipe_view.dart' as _i11;
import '../views/recipe_creator/recipe_creator.dart' as _i5;
import '../views/recipe_list/recipe_list_page.dart' as _i8;
import '../views/sign_up/sign_up_page.dart' as _i2;
import '../views/single_recipe/recipe_page.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.SignUpPage());
    },
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainPage());
    },
    RecipeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RecipeRouteArgs>(
          orElse: () =>
              RecipeRouteArgs(recipeId: pathParams.getString('recipeId')));
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i4.RecipePage(
              key: args.key,
              recipeId: args.recipeId,
              recipe: args.recipe,
              heroTag: args.heroTag));
    },
    RecipeCreator.name: (routeData) {
      final args = routeData.argsAs<RecipeCreatorArgs>(
          orElse: () => const RecipeCreatorArgs());
      return _i6.CupertinoPageX<_i13.RecipeModel>(
          routeData: routeData,
          child: _i5.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    RecipeEditor.name: (routeData) {
      final args = routeData.argsAs<RecipeEditorArgs>(
          orElse: () => const RecipeEditorArgs());
      return _i6.CupertinoPageX<_i13.RecipeModel>(
          routeData: routeData,
          child: _i5.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    HomeRouter.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    CategoriesRouter.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    SearchRouter.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    },
    RecipeListRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeListRouteArgs>(
          orElse: () => const RecipeListRouteArgs());
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i8.RecipeListPage(
              key: args.key, categoryFilters: args.categoryFilters));
    },
    CategoriesRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i9.CategoriesPage());
    },
    CategoryRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryRouteArgs>(
          orElse: () => const CategoryRouteArgs());
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i8.RecipeListPage(
              key: args.key, categoryFilters: args.categoryFilters));
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i8.RecipeListPage(
              key: args.key, categoryFilters: args.categoryFilters));
    },
    ProfileRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i10.ProfilePage());
    },
    FavoritesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FavoritesRouteArgs>(
          orElse: () =>
              FavoritesRouteArgs(listMode: pathParams.getString('listMode')));
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i11.ProfileRecipeView(key: args.key, listMode: args.listMode));
    },
    OwnedRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OwnedRouteArgs>(
          orElse: () =>
              OwnedRouteArgs(listMode: pathParams.getString('listMode')));
      return _i6.CupertinoPageX<dynamic>(
          routeData: routeData,
          child:
              _i11.ProfileRecipeView(key: args.key, listMode: args.listMode));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i6.RouteConfig(LoginRoute.name, path: '/login'),
        _i6.RouteConfig(SignUpRoute.name, path: '/sign-up'),
        _i6.RouteConfig(MainRoute.name, path: '/main', children: [
          _i6.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i6.RouteConfig(RecipeListRoute.name,
                    path: 'browse', parent: HomeRouter.name)
              ]),
          _i6.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(CategoriesRoute.name,
                    path: '', parent: CategoriesRouter.name),
                _i6.RouteConfig(CategoryRoute.name,
                    path: 'recipe-list-page', parent: CategoriesRouter.name)
              ]),
          _i6.RouteConfig(SearchRouter.name,
              path: 'search',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(SearchRoute.name,
                    path: '', parent: SearchRouter.name)
              ]),
          _i6.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(ProfileRoute.name,
                    path: '', parent: ProfileRouter.name),
                _i6.RouteConfig(FavoritesRoute.name,
                    path: ':listMode', parent: ProfileRouter.name),
                _i6.RouteConfig(OwnedRoute.name,
                    path: ':listMode', parent: ProfileRouter.name)
              ])
        ]),
        _i6.RouteConfig(RecipeRoute.name, path: '/recipes/:recipeId'),
        _i6.RouteConfig(RecipeCreator.name, path: '/recipe-creator'),
        _i6.RouteConfig(RecipeEditor.name, path: '/recipe-editor')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.RecipePage]
class RecipeRoute extends _i6.PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute(
      {_i12.Key? key,
      required String recipeId,
      _i13.RecipeModel? recipe,
      _i12.UniqueKey? heroTag})
      : super(RecipeRoute.name,
            path: '/recipes/:recipeId',
            args: RecipeRouteArgs(
                key: key, recipeId: recipeId, recipe: recipe, heroTag: heroTag),
            rawPathParams: {'recipeId': recipeId});

  static const String name = 'RecipeRoute';
}

class RecipeRouteArgs {
  const RecipeRouteArgs(
      {this.key, required this.recipeId, this.recipe, this.heroTag});

  final _i12.Key? key;

  final String recipeId;

  final _i13.RecipeModel? recipe;

  final _i12.UniqueKey? heroTag;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipeId: $recipeId, recipe: $recipe, heroTag: $heroTag}';
  }
}

/// generated route for
/// [_i5.RecipeCreatorScreen]
class RecipeCreator extends _i6.PageRouteInfo<RecipeCreatorArgs> {
  RecipeCreator(
      {_i12.Key? key,
      String title = "New recipe",
      _i13.RecipeModel? editableRecipe})
      : super(RecipeCreator.name,
            path: '/recipe-creator',
            args: RecipeCreatorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeCreator';
}

class RecipeCreatorArgs {
  const RecipeCreatorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i12.Key? key;

  final String title;

  final _i13.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeCreatorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i5.RecipeCreatorScreen]
class RecipeEditor extends _i6.PageRouteInfo<RecipeEditorArgs> {
  RecipeEditor(
      {_i12.Key? key,
      String title = "New recipe",
      _i13.RecipeModel? editableRecipe})
      : super(RecipeEditor.name,
            path: '/recipe-editor',
            args: RecipeEditorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeEditor';
}

class RecipeEditorArgs {
  const RecipeEditorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i12.Key? key;

  final String title;

  final _i13.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeEditorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeRouter extends _i6.PageRouteInfo<void> {
  const HomeRouter({List<_i6.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CategoriesRouter extends _i6.PageRouteInfo<void> {
  const CategoriesRouter({List<_i6.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SearchRouter extends _i6.PageRouteInfo<void> {
  const SearchRouter({List<_i6.PageRouteInfo>? children})
      : super(SearchRouter.name, path: 'search', initialChildren: children);

  static const String name = 'SearchRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class ProfileRouter extends _i6.PageRouteInfo<void> {
  const ProfileRouter({List<_i6.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.RecipeListPage]
class RecipeListRoute extends _i6.PageRouteInfo<RecipeListRouteArgs> {
  RecipeListRoute({_i12.Key? key, List<_i14.CategoryModel>? categoryFilters})
      : super(RecipeListRoute.name,
            path: 'browse',
            args: RecipeListRouteArgs(
                key: key, categoryFilters: categoryFilters));

  static const String name = 'RecipeListRoute';
}

class RecipeListRouteArgs {
  const RecipeListRouteArgs({this.key, this.categoryFilters});

  final _i12.Key? key;

  final List<_i14.CategoryModel>? categoryFilters;

  @override
  String toString() {
    return 'RecipeListRouteArgs{key: $key, categoryFilters: $categoryFilters}';
  }
}

/// generated route for
/// [_i9.CategoriesPage]
class CategoriesRoute extends _i6.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: '');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i8.RecipeListPage]
class CategoryRoute extends _i6.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute({_i12.Key? key, List<_i14.CategoryModel>? categoryFilters})
      : super(CategoryRoute.name,
            path: 'recipe-list-page',
            args:
                CategoryRouteArgs(key: key, categoryFilters: categoryFilters));

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs({this.key, this.categoryFilters});

  final _i12.Key? key;

  final List<_i14.CategoryModel>? categoryFilters;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, categoryFilters: $categoryFilters}';
  }
}

/// generated route for
/// [_i8.RecipeListPage]
class SearchRoute extends _i6.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i12.Key? key, List<_i14.CategoryModel>? categoryFilters})
      : super(SearchRoute.name,
            path: '',
            args: SearchRouteArgs(key: key, categoryFilters: categoryFilters));

  static const String name = 'SearchRoute';
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key, this.categoryFilters});

  final _i12.Key? key;

  final List<_i14.CategoryModel>? categoryFilters;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, categoryFilters: $categoryFilters}';
  }
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i11.ProfileRecipeView]
class FavoritesRoute extends _i6.PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({_i12.Key? key, required String listMode})
      : super(FavoritesRoute.name,
            path: ':listMode',
            args: FavoritesRouteArgs(key: key, listMode: listMode),
            rawPathParams: {'listMode': listMode});

  static const String name = 'FavoritesRoute';
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({this.key, required this.listMode});

  final _i12.Key? key;

  final String listMode;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key, listMode: $listMode}';
  }
}

/// generated route for
/// [_i11.ProfileRecipeView]
class OwnedRoute extends _i6.PageRouteInfo<OwnedRouteArgs> {
  OwnedRoute({_i12.Key? key, required String listMode})
      : super(OwnedRoute.name,
            path: ':listMode',
            args: OwnedRouteArgs(key: key, listMode: listMode),
            rawPathParams: {'listMode': listMode});

  static const String name = 'OwnedRoute';
}

class OwnedRouteArgs {
  const OwnedRouteArgs({this.key, required this.listMode});

  final _i12.Key? key;

  final String listMode;

  @override
  String toString() {
    return 'OwnedRouteArgs{key: $key, listMode: $listMode}';
  }
}
