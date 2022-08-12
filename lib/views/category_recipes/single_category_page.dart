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
import 'package:flutter_e_commerce/widgets/recipe_item.dart';

import '../../routes/route_service.dart';

class SingleCategoryScreen extends StatelessWidget {
  const SingleCategoryScreen({
    Key? key,
    this.category,
    @PathParam() required this.categoryId,
  }) : super(key: key);
  final CategoryModel? category;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: category!.name,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: SingleCategoryScreenBody(
          category: category!,
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
    return Column(
      children: [
        BlocBuilder<CategoryRecipesCubit, CategoryRecipesState>(
          bloc: BlocProvider.of<CategoryRecipesCubit>(context)..getCategoryRecipes(category),
          builder: (context, state) {
            switch (state.status) {
              case CategoryRecipesStateStatus.initial:
                return const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              case CategoryRecipesStateStatus.loading:
                return const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              case CategoryRecipesStateStatus.loaded:
                final recipeList = state.recipeList;
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return RecipeItem(
                        recipe: recipeList[index],
                      );
                    },
                  ),
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
