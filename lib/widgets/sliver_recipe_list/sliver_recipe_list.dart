import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';

class SliverRecipeList extends StatelessWidget {
  const SliverRecipeList({Key? key, required this.recipeList, required this.tagFilters}) : super(key: key);

  final List<TagModel> tagFilters;
  final List<RecipeModel> recipeList;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      sliver: LiveSliverList(
          controller: ScrollController(),
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
                  child: RecipeItem(recipe: recipe, tagFilters: tagFilters),
                ),
              ),
            );
          }),
    );
  }
}
