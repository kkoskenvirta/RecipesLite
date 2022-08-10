import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
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
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<RecipeSearchCubit>(context);
    // final searchController = TextEditingController(text: '');

    return Scaffold(
      appBar: MainAppBar(
        title: "Search",
        showBackButton: false,
        showCloseButton: true,
        elevation: false,
        size: 60,
      ),
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: ((context, constraints) => Container(
              padding: EdgeInsets.only(
                top: 0,
                bottom: Dimensions.height20,
                left: Dimensions.height15,
                right: Dimensions.height15,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight, maxHeight: constraints.maxHeight),
                child: Column(
                  children: [
                    BlocBuilder<RecipeSearchCubit, RecipeSearchState>(
                      buildWhen: (previous, current) {
                        return previous.filterApplied != current.filterApplied;
                      },
                      builder: (context, state) {
                        final searchController = TextEditingController()
                          ..text = state.searchString
                          ..selection = TextSelection.collapsed(offset: state.searchString.length);
                        return CupertinoSearchTextField(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          placeholder: "Search for recipes",
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                          itemSize: 26,
                          controller: searchController,
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                          suffixIcon: const Icon(Icons.close_rounded),
                          onSuffixTap: () {
                            if (searchController.value.text.isEmpty) {
                              Navigator.pop(context);
                            } else {
                              searchCubit.resetSearch();
                              searchController.text = "";
                            }
                          },
                          onChanged: ((value) async {
                            if (value.isNotEmpty) {
                              searchCubit.searchRecipes(value);
                            }
                          }),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SearchResultList(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
