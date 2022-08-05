import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/views/category_recipes/cubit/category_recipes_cubit.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/custom_appbar.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:get/get.dart';

import '../../routes/route_service.dart';

class SingleCategoryScreen extends StatelessWidget {
  SingleCategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryModel category = Get.arguments;

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
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

class SingleCategoryHeader extends StatelessWidget {
  const SingleCategoryHeader({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: LargeText(text: category.name),
              )
            ],
          ),
        ],
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
    return BlocBuilder<CategoryRecipesCubit, CategoryRecipesState>(
        bloc: BlocProvider.of<CategoryRecipesCubit>(context)..getCategoryRecipes(category),
        builder: (context, state) {
          switch (state.status) {
            case CategoryRecipesStateStatus.initial:
              return const Center(child: CircularProgressIndicator());
            case CategoryRecipesStateStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case CategoryRecipesStateStatus.loaded:
              final recipeList = state.recipeList;
              return Column(
                children: [
                  ListView.builder(
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
                          // Get.to(() => RecipePage(recipe: recipe));
                          Get.toNamed(Routes.recipe.name, arguments: recipe);
                        },
                      );
                    },
                  ),
                ],
              );
            default:
              return const Text("Error");
          }
        });
  }
}
