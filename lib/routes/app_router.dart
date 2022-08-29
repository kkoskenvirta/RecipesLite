import 'package:auto_route/auto_route.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/utils/custom_transitions.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/categories/categories_page.dart';
import 'package:flutter_e_commerce/views/main/home_page.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_recipe_view.dart';
import 'package:flutter_e_commerce/views/profile/profile_page.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/recipe_list/recipe_list_page.dart';
import 'package:flutter_e_commerce/views/sign_up/sign_up_page.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';

@MaterialAutoRouter(
  routes: [
    CustomRoute(
      page: LoginPage,
      path: '/login',
      initial: true,
      transitionsBuilder: CustomTransitions.slideLeftWithFade,
    ),
    CustomRoute(
      page: SignUpPage,
      path: '/sign-up',
      transitionsBuilder: CustomTransitions.slideLeftWithFade,
    ),
    AutoRoute(page: MainPage, path: '/main', children: [
      CustomRoute(
        name: "HomeRouter",
        page: EmptyRouterPage,
        path: 'home',
        transitionsBuilder: CustomTransitions.slideLeftWithFade,
        children: [
          CustomRoute(
              path: '', page: HomePage, maintainState: true, transitionsBuilder: CustomTransitions.slideLeftWithFade),
          CustomRoute(path: 'browse', page: RecipeListPage, transitionsBuilder: CustomTransitions.slideLeftWithFade),
        ],
      ),
      CustomRoute(
        name: "CategoriesRouter",
        page: EmptyRouterPage,
        path: 'categories',
        transitionsBuilder: CustomTransitions.slideLeftWithFade,
        children: [
          CustomRoute(path: '', page: CategoriesPage, transitionsBuilder: CustomTransitions.slideLeftWithFade),
          CustomRoute(
              name: "CategoryRoute", page: RecipeListPage, transitionsBuilder: CustomTransitions.slideLeftWithFade),
        ],
      ),
      CustomRoute(
        name: "SearchRouter",
        page: EmptyRouterPage,
        path: 'search',
        transitionsBuilder: CustomTransitions.slideLeftWithFade,
        children: [
          CustomRoute(
            path: '',
            name: "SearchRoute",
            page: RecipeListPage,
            transitionsBuilder: CustomTransitions.slideLeftWithFade,
          ),
        ],
      ),
      CustomRoute(
        name: "ProfileRouter",
        page: EmptyRouterPage,
        path: 'profile',
        transitionsBuilder: CustomTransitions.slideLeftWithFade,
        children: [
          CustomRoute(
            path: '',
            page: ProfilePage,
            transitionsBuilder: CustomTransitions.slideLeftWithFade,
          ),
          CustomRoute(
            name: "FavoritesRoute",
            path: ':listMode',
            page: ProfileRecipeView,
            transitionsBuilder: CustomTransitions.slideLeftWithFade,
          ),
          CustomRoute(
            name: "OwnedRoute",
            path: ':listMode',
            page: ProfileRecipeView,
            transitionsBuilder: CustomTransitions.slideLeftWithFade,
          ),
        ],
      ),
    ]),
    CustomRoute(
      path: '/recipes/:recipeId',
      page: RecipePage,
      transitionsBuilder: CustomTransitions.slideLeftWithFade,
    ),
    CustomRoute<RecipeModel>(
      name: "RecipeCreator",
      page: RecipeCreatorScreen,
      path: '/recipe-creator',
      transitionsBuilder: CustomTransitions.slideLeftWithFade,
    ),
    CustomRoute<RecipeModel>(
      name: "RecipeEditor",
      page: RecipeCreatorScreen,
      path: '/recipe-editor',
      transitionsBuilder: CustomTransitions.slideLeftWithFade,
    ),
    // CustomRoute(
    //   page: SearchPage,
    //   path: '/search',
    //   transitionsBuilder: CustomTransitions.slideLeftWithFade,
    // ),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
