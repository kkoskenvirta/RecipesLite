import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';

import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class SearchResultList extends StatelessWidget {
  SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeSearchCubit, RecipeSearchState>(builder: (context, state) {
      if (state is RecipeSearchInitial) {
        return const SearchError(text: "Search for your favorite recipies! 🥘");
      } else if (state is RecipeSearchLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is RecipeSearchLoaded && state.recipeList.isNotEmpty) {
        final recipeList = state.recipeList;
        return Flexible(
          child: Column(
            children: [
              SmallText(
                text: "Found ${state.recipeList.length} result(s)",
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recipeList.length,
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) {
                    final RecipeModel resultRecipe = recipeList[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (context) => RecipePage(recipeModel: resultRecipe),
                            ));
                      },
                      child: PopularListItem(
                        title: resultRecipe.name!,
                        difficulty: resultRecipe.difficulty!,
                        description: resultRecipe.shortDescription!,
                        timeEstimate: resultRecipe.preparationTime!,
                        imageUrl: resultRecipe.picture,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else if (state is RecipeSearchLoaded && state.recipeList.isEmpty) {
        return const SearchError(text: "No results found 😪");
      } else {
        return const SearchError(text: "Something went terribly ☠️");
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
    return Container(
      child: Column(
        children: [
          Image.asset('assets/images/not-found.png'),
          SizedBox(
            height: 16,
          ),
          LargeText(text: text),
        ],
      ),
    );
  }
}
