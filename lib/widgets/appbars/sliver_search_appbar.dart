import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SliverSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  SliverSearchAppBar({
    Key? key,
    this.title,
    this.transparent = false,
    this.creator,
    this.editRecipe,
    this.showLogoutButton = false,
    this.showSearchButton = false,
    this.showBackButton = false,
    this.showEditButton = false,
    this.showCreateButton = false,
    this.showCloseButton = false,
    this.size = 50,
    this.elevation = true,
  })  : preferredSize = Size.fromHeight(size),
        super(key: key);

  final double size;
  final String? title;
  final bool transparent;

  final String? creator;
  final VoidCallback? editRecipe;

  final bool elevation;

  final bool showLogoutButton;
  final bool showSearchButton;
  final bool showBackButton;
  final bool showEditButton;
  final bool showCreateButton;
  final bool showCloseButton;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: transparent ? Colors.transparent : null,
      shadowColor: transparent ? Colors.transparent : null,
      scrolledUnderElevation: elevation ? null : 0,
      automaticallyImplyLeading: showBackButton ? true : false,
      bottom: SearchBar(
        size: 50.0,
      ),
      title: LargeText(text: title!),
      leading: showSearchButton
          ? IconButton(
              onPressed: (() => router.push(SearchRoute())),
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            )
          : showBackButton
              ? const AutoLeadingButton()
              : null,
    );
  }
}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar({Key? key, required size})
      : preferredSize = Size.fromHeight(size),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<RecipeSearchCubit>(context);

    return BlocBuilder<RecipeSearchCubit, RecipeSearchState>(
      buildWhen: (previous, current) {
        return previous.filterApplied != current.filterApplied;
      },
      builder: (context, state) {
        final searchController = TextEditingController()
          ..text = state.searchString
          ..selection = TextSelection.collapsed(offset: state.searchString.length);
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 0, bottom: 8),
            child: CupertinoSearchTextField(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                if (value == "") {
                  searchCubit.resetSearch();
                }
                if (value.isNotEmpty) {
                  searchCubit.searchRecipes(value);
                }
              }),
            ),
          ),
        );
      },
    );
  }
}
