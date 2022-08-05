import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/views/category_recipes/cubit/category_recipes_cubit.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:get/get.dart';

import '../../routes/route_service.dart';

class SingleCategoryScreen extends StatelessWidget {
  const SingleCategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: category.name),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: SingleCategoryScreenBody(
                  category: category,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleCategoryScreenBody extends StatelessWidget {
  const SingleCategoryScreenBody({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return Column(
      children: [
        BlocBuilder<CategoryRecipesCubit, CategoryRecipesState>(
          bloc: BlocProvider.of<CategoryRecipesCubit>(context)..getCategoryRecipes(category),
          builder: (context, state) {
            switch (state.status) {
              case CategoryRecipesStateStatus.initial:
                return const CircularProgressIndicator();
              case CategoryRecipesStateStatus.loading:
                return const CircularProgressIndicator();
              case CategoryRecipesStateStatus.loaded:
                final recipeList = state.recipeList;
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
                        router.push(RecipeRoute(recipe: recipe));
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
