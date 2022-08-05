import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/category_recipes/cubit/category_recipes_cubit.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:get/get.dart';

class ProfileRecipeView extends StatelessWidget {
  const ProfileRecipeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RecipeListArgs recipeListArgs = Get.arguments;
    final String title = recipeListArgs.title;
    final ListMode mode = recipeListArgs.mode;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileRecipeViewHeader(
              title: title,
            ),
            BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
                List<RecipeModel> recipes;
                recipes = mode == ListMode.favorites ? state.favorites : state.recipes;

                return Flexible(
                  child: SingleChildScrollView(
                    child: ProfileRecipeViewBody(
                      recipes: recipes,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProfileRecipeViewHeader extends StatelessWidget {
  const ProfileRecipeViewHeader({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Header(
      title: title,
      leadingButtonIcon: const Icon(Icons.chevron_left_rounded),
      onLeadingButtonPressed: () => Navigator.pop(context),
      showTrailingButton: false,
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
                        Get.toNamed(Routes.recipe.name, arguments: recipe);
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
