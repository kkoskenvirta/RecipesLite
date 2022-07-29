import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal_results.dart';

class SearchModal extends StatelessWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeSearchCubit>(
      create: (context) => RecipeSearchCubit(
        recipesRepository: context.read<RecipesRepository>(),
      ),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<RecipeSearchCubit>(context);
    final searchController = TextEditingController(text: '');

    return LayoutBuilder(
      builder: ((context, constraints) => Container(
            padding: EdgeInsets.all(Dimensions.height20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight, maxHeight: constraints.maxHeight),
              child: Column(
                children: [
                  LargeText(text: "Recipe search"),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black12,
                        )
                      ],
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search for recipes",
                                fillColor: Colors.white,
                              ),
                              controller: searchController,
                              onChanged: ((value) async {
                                if (value.isNotEmpty) {
                                  searchCubit.searchRecipes(value);
                                }
                              }),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (searchController.value.text.isEmpty) {
                                Navigator.pop(context);
                              } else {
                                searchController.text = "";
                              }
                            },
                            child: Icon(Icons.close_rounded),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SearchResultList(),
                ],
              ),
            ),
          )),
    );
  }
}
