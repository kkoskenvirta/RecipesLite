// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i14;

import '../models/category/category_model.dart' as _i17;
import '../models/recipe/recipe_model.dart' as _i15;
import '../utils/custom_transitions.dart' as _i16;
import '../views/login/login_page.dart' as _i1;
import '../views/main/categories/categories_page.dart' as _i10;
import '../views/main/home_page.dart' as _i8;
import '../views/main/main_page.dart' as _i3;
import '../views/profile/profile_recipe_view.dart' as _i13;
import '../views/profile/profile_screen.dart' as _i12;
import '../views/recipe_creator/recipe_creator.dart' as _i5;
import '../views/recipe_list_page/recipe_list_page.dart' as _i9;
import '../views/register/register_page.dart' as _i2;
import '../views/search/search_page.dart' as _i6;
import '../views/single_category_page/single_category_page.dart' as _i11;
import '../views/single_recipe/recipe_page.dart' as _i4;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    MainRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MainPage());
    },
    RecipeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<RecipeRouteArgs>(
          orElse: () =>
              RecipeRouteArgs(recipeId: pathParams.getString('recipeId')));
      return _i7.MaterialPageX<dynamic>(
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
      return _i7.MaterialPageX<_i15.RecipeModel>(
          routeData: routeData,
          child: _i5.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    RecipeEditor.name: (routeData) {
      final args = routeData.argsAs<RecipeEditorArgs>(
          orElse: () => const RecipeEditorArgs());
      return _i7.MaterialPageX<_i15.RecipeModel>(
          routeData: routeData,
          child: _i5.RecipeCreatorScreen(
              key: args.key,
              title: args.title,
              editableRecipe: args.editableRecipe));
    },
    SearchRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.SearchPage(),
          transitionsBuilder: _i16.CustomTransitions.slideRight,
          durationInMilliseconds: 200,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    CategoriesRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomePage());
    },
    RecipeListRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RecipeListPage());
    },
    CategoriesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.CategoriesPage());
    },
    CategoryRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CategoryRouteArgs>(
          orElse: () => CategoryRouteArgs(
              categoryId: pathParams.getString('categoryId')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.SingleCategoryPage(
              key: args.key,
              categoryFilters: args.categoryFilters,
              categoryId: args.categoryId));
    },
    ProfileScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ProfileScreen());
    },
    FavoritesRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<FavoritesRouteArgs>(
          orElse: () =>
              FavoritesRouteArgs(listMode: pathParams.getString('listMode')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i13.ProfileRecipeView(key: args.key, listMode: args.listMode));
    },
    OwnedRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OwnedRouteArgs>(
          orElse: () =>
              OwnedRouteArgs(listMode: pathParams.getString('listMode')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i13.ProfileRecipeView(key: args.key, listMode: args.listMode));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i7.RouteConfig(LoginRoute.name, path: '/login'),
        _i7.RouteConfig(RegisterRoute.name, path: '/register'),
        _i7.RouteConfig(MainRoute.name, path: '/main', children: [
          _i7.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MainRoute.name,
              children: [
                _i7.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i7.RouteConfig(RecipeListRoute.name,
                    path: 'browse', parent: HomeRouter.name)
              ]),
          _i7.RouteConfig(CategoriesRouter.name,
              path: 'categories',
              parent: MainRoute.name,
              children: [
                _i7.RouteConfig(CategoriesRoute.name,
                    path: '', parent: CategoriesRouter.name),
                _i7.RouteConfig(CategoryRoute.name,
                    path: ':categoryId', parent: CategoriesRouter.name)
              ]),
          _i7.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: MainRoute.name,
              children: [
                _i7.RouteConfig(ProfileScreen.name,
                    path: '', parent: ProfileRouter.name),
                _i7.RouteConfig(FavoritesRoute.name,
                    path: ':listMode', parent: ProfileRouter.name),
                _i7.RouteConfig(OwnedRoute.name,
                    path: ':listMode', parent: ProfileRouter.name)
              ])
        ]),
        _i7.RouteConfig(RecipeRoute.name, path: '/recipes/:recipeId'),
        _i7.RouteConfig(RecipeCreator.name, path: '/recipe-creator'),
        _i7.RouteConfig(RecipeEditor.name, path: '/recipe-editor'),
        _i7.RouteConfig(SearchRoute.name, path: '/search')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.RecipePage]
class RecipeRoute extends _i7.PageRouteInfo<RecipeRouteArgs> {
  RecipeRoute(
      {_i14.Key? key,
      required String recipeId,
      _i15.RecipeModel? recipe,
      _i14.UniqueKey? heroTag})
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

  final _i14.Key? key;

  final String recipeId;

  final _i15.RecipeModel? recipe;

  final _i14.UniqueKey? heroTag;

  @override
  String toString() {
    return 'RecipeRouteArgs{key: $key, recipeId: $recipeId, recipe: $recipe, heroTag: $heroTag}';
  }
}

/// generated route for
/// [_i5.RecipeCreatorScreen]
class RecipeCreator extends _i7.PageRouteInfo<RecipeCreatorArgs> {
  RecipeCreator(
      {_i14.Key? key,
      String title = "New recipe",
      _i15.RecipeModel? editableRecipe})
      : super(RecipeCreator.name,
            path: '/recipe-creator',
            args: RecipeCreatorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeCreator';
}

class RecipeCreatorArgs {
  const RecipeCreatorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i14.Key? key;

  final String title;

  final _i15.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeCreatorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i5.RecipeCreatorScreen]
class RecipeEditor extends _i7.PageRouteInfo<RecipeEditorArgs> {
  RecipeEditor(
      {_i14.Key? key,
      String title = "New recipe",
      _i15.RecipeModel? editableRecipe})
      : super(RecipeEditor.name,
            path: '/recipe-editor',
            args: RecipeEditorArgs(
                key: key, title: title, editableRecipe: editableRecipe));

  static const String name = 'RecipeEditor';
}

class RecipeEditorArgs {
  const RecipeEditorArgs(
      {this.key, this.title = "New recipe", this.editableRecipe});

  final _i14.Key? key;

  final String title;

  final _i15.RecipeModel? editableRecipe;

  @override
  String toString() {
    return 'RecipeEditorArgs{key: $key, title: $title, editableRecipe: $editableRecipe}';
  }
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: '/search');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class HomeRouter extends _i7.PageRouteInfo<void> {
  const HomeRouter({List<_i7.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class CategoriesRouter extends _i7.PageRouteInfo<void> {
  const CategoriesRouter({List<_i7.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'categories', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i7.EmptyRouterPage]
class ProfileRouter extends _i7.PageRouteInfo<void> {
  const ProfileRouter({List<_i7.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.RecipeListPage]
class RecipeListRoute extends _i7.PageRouteInfo<void> {
  const RecipeListRoute() : super(RecipeListRoute.name, path: 'browse');

  static const String name = 'RecipeListRoute';
}

/// generated route for
/// [_i10.CategoriesPage]
class CategoriesRoute extends _i7.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: '');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i11.SingleCategoryPage]
class CategoryRoute extends _i7.PageRouteInfo<CategoryRouteArgs> {
  CategoryRoute(
      {_i14.Key? key,
      List<_i17.CategoryModel>? categoryFilters,
      required String categoryId})
      : super(CategoryRoute.name,
            path: ':categoryId',
            args: CategoryRouteArgs(
                key: key,
                categoryFilters: categoryFilters,
                categoryId: categoryId),
            rawPathParams: {'categoryId': categoryId});

  static const String name = 'CategoryRoute';
}

class CategoryRouteArgs {
  const CategoryRouteArgs(
      {this.key, this.categoryFilters, required this.categoryId});

  final _i14.Key? key;

  final List<_i17.CategoryModel>? categoryFilters;

  final String categoryId;

  @override
  String toString() {
    return 'CategoryRouteArgs{key: $key, categoryFilters: $categoryFilters, categoryId: $categoryId}';
  }
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileScreen extends _i7.PageRouteInfo<void> {
  const ProfileScreen() : super(ProfileScreen.name, path: '');

  static const String name = 'ProfileScreen';
}

/// generated route for
/// [_i13.ProfileRecipeView]
class FavoritesRoute extends _i7.PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({_i14.Key? key, required String listMode})
      : super(FavoritesRoute.name,
            path: ':listMode',
            args: FavoritesRouteArgs(key: key, listMode: listMode),
            rawPathParams: {'listMode': listMode});

  static const String name = 'FavoritesRoute';
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({this.key, required this.listMode});

  final _i14.Key? key;

  final String listMode;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key, listMode: $listMode}';
  }
}

/// generated route for
/// [_i13.ProfileRecipeView]
class OwnedRoute extends _i7.PageRouteInfo<OwnedRouteArgs> {
  OwnedRoute({_i14.Key? key, required String listMode})
      : super(OwnedRoute.name,
            path: ':listMode',
            args: OwnedRouteArgs(key: key, listMode: listMode),
            rawPathParams: {'listMode': listMode});

  static const String name = 'OwnedRoute';
}

class OwnedRouteArgs {
  const OwnedRouteArgs({this.key, required this.listMode});

  final _i14.Key? key;

  final String listMode;

  @override
  String toString() {
    return 'OwnedRouteArgs{key: $key, listMode: $listMode}';
  }
}
