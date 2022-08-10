import 'package:auto_animated/auto_animated.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final router = AutoRouter.of(context);
    return BlocBuilder<RecipeSearchCubit, RecipeSearchState>(builder: (context, state) {
      switch (state.status) {
        case RecipeSearchStatus.initial:
          return SliverToBoxAdapter(child: SearchRecommendations());

        case RecipeSearchStatus.loading:
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );

        case RecipeSearchStatus.loaded:
          final recipeList = state.recipeList;
          return recipeList != null
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  // sliver: SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //     (_, int index) {
                  //       final recipe = recipeList[index];
                  //       return Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  //         child: RecipeItem(
                  //           title: recipe.name!,
                  //           difficulty: recipe.difficulty!,
                  //           description: recipe.shortDescription!,
                  //           timeEstimate: recipe.preparationTime!,
                  //           imageUrl: recipe.picture,
                  //           blurhash: recipe.blurhash,
                  //           categories: recipe.categories!,
                  //           tags: recipe.tags!,
                  //         ),
                  //       );
                  //     },
                  // childCount: recipeList.length,
                  //   ),
                  sliver: LiveSliverList(
                      controller: scrollController,
                      itemCount: recipeList.length,
                      showItemDuration: const Duration(milliseconds: 200),
                      itemBuilder: (context, index, animation) {
                        final recipe = recipeList[index];

                        return FadeTransition(
                          opacity: Tween<double>(
                            begin: 0,
                            end: 1,
                          ).animate(animation),
                          // And slide transition
                          child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -0.1),
                                end: Offset.zero,
                              ).animate(animation),
                              // Paste you Widget
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
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
                              )),
                        );
                      }),
                )
              : const SliverToBoxAdapter(child: SearchError(text: "No results found 😪"));
        case RecipeSearchStatus.error:
          return const SliverToBoxAdapter(child: SearchError(text: "Something went wrong 😪"));

        default:
          return const SizedBox();
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
        LargeText(text: text),
        const SizedBox(
          height: 0,
        ),
      ],
    );
  }
}

class SearchRecommendations extends StatelessWidget {
  SearchRecommendations({Key? key}) : super(key: key);
  final List<String> recommendations = ["Lunch", "Breakfast", "Vegan", "Soup", "Gluten-free", "Egg-free", "Asian"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
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
      ),
    );
  }
}
