import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';

import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class SearchResultList extends StatelessWidget {
  SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocBuilder<RecipeSearchCubit, RecipeSearchState>(builder: (context, state) {
      switch (state.status) {
        case RecipeSearchStatus.initial:
          return SearchRecommendations();
        case RecipeSearchStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );

        case RecipeSearchStatus.loaded:
          final recipeList = state.recipeList;
          return recipeList != null
              ? Flexible(
                  child: Column(
                    children: [
                      SmallText(
                        text: "Found ${recipeList.length} result(s)",
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Flexible(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 14,
                            );
                          },
                          shrinkWrap: true,
                          itemCount: recipeList.length,
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, index) {
                            final RecipeModel recipe = recipeList[index];

                            return GestureDetector(
                              onTap: () {
                                router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!));
                              },
                              child: RecipeItem(
                                title: recipe.name!,
                                difficulty: recipe.difficulty!,
                                description: recipe.shortDescription!,
                                timeEstimate: recipe.preparationTime!,
                                imageUrl: recipe.picture,
                                blurhash: recipe.blurhash,
                                categories: recipe.categories!,
                                tags: recipe.tags!,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const SearchError(text: "No results found 😪");
        case RecipeSearchStatus.error:
          return const SearchError(text: "Something went wrong 😪");

        default:
          return SizedBox();
      }
    });
  }
}

class SearchError extends StatelessWidget {
  const SearchError({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/not-found.png'),
        const SizedBox(
          height: 0,
        ),
        LargeText(text: text),
      ],
    );
  }
}

class SearchRecommendations extends StatelessWidget {
  SearchRecommendations({Key? key}) : super(key: key);
  final List<String> recommendations = ["Lunch", "Breakfast", "Vegan", "Soup", "Gluten-free", "Egg-free", "Asian"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: recommendations.map((recommendation) {
            return ActionChip(
              label: SmallText(
                text: recommendation,
                color: Colors.black87,
                size: 14,
              ),
              onPressed: () {
                BlocProvider.of<RecipeSearchCubit>(context).searchRecipes(recommendation);
                BlocProvider.of<RecipeSearchCubit>(context).updateSearchString(recommendation);
                FocusManager.instance.primaryFocus?.unfocus();
              },
            );
          }).toList(),
        ),
        const SearchError(text: "Search for your favorite recipies! 🥘")
      ],
    );
  }
}
