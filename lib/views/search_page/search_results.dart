import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return BlocBuilder<RecipeSearchCubit, RecipeSearchState>(builder: (context, state) {
      switch (state.status) {
        case RecipeSearchStatus.initial:
          return SliverToBoxAdapter(child: SearchRecommendations());

        case RecipeSearchStatus.loading:
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );

        case RecipeSearchStatus.loaded:
          final recipeList = state.recipeList;
          return recipeList != null
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  sliver: LiveSliverList(
                      controller: scrollController,
                      itemCount: recipeList.length,
                      showItemDuration: const Duration(milliseconds: 150),
                      showItemInterval: const Duration(milliseconds: 50),
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
                                  recipe: recipe,
                                ),
                              )),
                        );
                      }),
                )
              : const SliverToBoxAdapter(child: SearchError(text: "No recipes found 🥺"));
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
              final key = GlobalKey();
              return ActionChip(
                key: key,
                backgroundColor: RecipeAppTheme.colors.pinkAccent,
                label: SmallText(
                  text: recommendation,
                  color: Colors.white,
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
