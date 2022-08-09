import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'dart:async';

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
    final searchController = TextEditingController(text: '');

    return LayoutBuilder(
      builder: ((context, constraints) => Container(
            padding: EdgeInsets.all(Dimensions.height20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight, maxHeight: constraints.maxHeight),
              child: Column(
                children: [
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
                      child: SearchField(searchController: searchController, searchCubit: searchCubit),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SearchResultList(),
                ],
              ),
            ),
          )),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.searchController,
    required this.searchCubit,
  }) : super(key: key);

  final TextEditingController searchController;
  final RecipeSearchCubit searchCubit;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(border: InputBorder.none, hintText: "Search for recipes"),
            controller: widget.searchController,
            onChanged: ((value) async {
              if (value.isNotEmpty) {
                if (_debounce?.isActive ?? false) _debounce!.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () {
                  widget.searchCubit.searchRecipes(value);
                });
              }
            }),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (widget.searchController.value.text.isEmpty) {
              Navigator.pop(context);
            } else {
              widget.searchController.text = "";
            }
          },
          child: const Icon(Icons.close_rounded),
        ),
      ],
    );
  }
}
