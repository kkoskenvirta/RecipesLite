import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/category_recipes/cubit/category_recipes_cubit.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';

import '../../routes/app_router.gr.dart';

class ProfileRecipeView extends StatelessWidget {
  const ProfileRecipeView({
    Key? key,
    @PathParam('listMode') required this.listMode,
  })  : mode = listMode == "favorites" ? ListMode.favorites : ListMode.owned,
        title = listMode == "favorites" ? "Favorites" : "My recipes",
        super(key: key);

  final String listMode;
  final String title;
  final ListMode mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: title,
        showBackButton: true,
      ),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          List<RecipeModel> recipes;
          recipes = mode == ListMode.favorites ? state.favorites : state.recipes;

          return SingleChildScrollView(
            child: ProfileRecipeViewBody(
              recipes: recipes,
            ),
          );
        },
      ),
    );
  }
}

class ProfileRecipeViewBody extends StatelessWidget {
  const ProfileRecipeViewBody({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Column(
      children: [
        BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            switch (state.status) {
              case UserDataStateStatus.initial:
                return const CircularProgressIndicator();
              case UserDataStateStatus.loading:
                return const CircularProgressIndicator();
              case UserDataStateStatus.loaded:
                final recipeList = recipes;
                return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipeList.length,
                  itemBuilder: (context, index) {
                    final RecipeModel recipe = recipeList[index];
                    return PopularListItem(
                      title: recipe.name!,
                      difficulty: recipe.difficulty!,
                      description: recipe.shortDescription!,
                      timeEstimate: recipe.preparationTime!,
                      imageUrl: recipe.picture,
                      blurhash: recipe.blurhash,
                      onTap: () {
                        router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!));
                      },
                    );
                  },
                );
              default:
                return const Text("Error");
            }
          },
        )
      ],
    );
  }
}
