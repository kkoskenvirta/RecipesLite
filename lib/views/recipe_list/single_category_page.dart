import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/category/categories_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/recipe_list/cubit/category_recipes_cubit.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/category_list_item.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/search_modal_button.dart';

class SingleCategoryScreen extends StatelessWidget {
  const SingleCategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SingleCategoryHeader(
              category: category,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SingleCategoryScreenBody()
                ],
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
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left_rounded),
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
          padding: EdgeInsets.only(bottom: Dimensions.height10),
          child: LargeText(text: "Category: ${category.name}"),
        ),
      ],
    );
  }
}

class SingleCategoryScreenBody extends StatelessWidget {
  const SingleCategoryScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CategoryRecipesCubit, CategoryRecipesState>(
          builder: (context, state) {
            switch (state.status) {
              case CategoryRecipesStateStatus.loading:
                return CircularProgressIndicator();
              case CategoryRecipesStateStatus.loaded:
                final recipeList = state.recipeList;
                return Padding(
                  padding: EdgeInsets.all(Dimensions.width20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 220, crossAxisSpacing: 18, mainAxisSpacing: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      final RecipeModel recipe = recipeList[index];
                      return PopularListItem(
                        title: recipe.name,
                        difficulty: recipe.difficulty,
                        description: recipe.shortDescription,
                        timeEstimate: recipe.preparationTime,
                        imageUrl: recipe.picture,
                        onTap: () {
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (context) => RecipePage(recipeModel: recipe),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              default:
                return SizedBox();
            }
          },
        )
      ],
    );
  }
}
