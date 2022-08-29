import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/sort.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/views/recipe_list/cubit/recipe_list_cubit.dart';
import 'package:flutter_e_commerce/views/search/search_results.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_appbar_filter_tags.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_search_appbar.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_recipe_list.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({
    Key? key,
    this.categoryFilters,
  }) : super(key: key);

  final List<CategoryModel>? categoryFilters;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeListCubit(
        recipesRepository: context.read<RecipesRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      )
        ..getRecipes(categoryFilters)
        ..getTags(),
      child: BlocBuilder<RecipeListCubit, RecipeListState>(
        builder: (context, state) {
          final recipeListCubit = BlocProvider.of<RecipeListCubit>(context);

          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: RecipeListScrollView(
                recipeListCubit: recipeListCubit,
                showSearchBar: categoryFilters == null ? true : false,
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeListScrollView extends StatefulWidget {
  const RecipeListScrollView({
    Key? key,
    required this.recipeListCubit,
    this.categoryFilters,
    required this.showSearchBar,
  }) : super(key: key);
  final RecipeListCubit recipeListCubit;
  final List<CategoryModel>? categoryFilters;
  final bool showSearchBar;

  @override
  State<RecipeListScrollView> createState() => _RecipeListScrollViewState();
}

class _RecipeListScrollViewState extends State<RecipeListScrollView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    final state = widget.recipeListCubit.state;
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          state.fetchingMore != RecipeListStatus.loading &&
          state.listStatus != RecipeListStatus.loading &&
          state.noMoreResults != true) {
        widget.recipeListCubit.getRecipes(widget.categoryFilters);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          titleSpacing: 0.0,
          actions: const [SortButton()],
          floating: true,
          pinned: true,
          snap: true,
          scrolledUnderElevation: 0,
          title: widget.showSearchBar
              ? SearchBar(
                  size: 50.0,
                )
              : LargeText(
                  text: widget.categoryFilters != null ? widget.categoryFilters![0].name : "Browse",
                  fontSize: FontSize.large,
                ),
          bottom: FilterChips(size: 148.0),
        ),
        const _Body(),
      ],
    );
  }
}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar({
    Key? key,
    required size,
  })  : preferredSize = Size.fromHeight(size),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final recipeListCubit = BlocProvider.of<RecipeListCubit>(context);

    return BlocBuilder<RecipeListCubit, RecipeListState>(
      buildWhen: (previous, current) {
        return previous.searchString != current.searchString;
      },
      builder: (context, state) {
        final searchController = TextEditingController()
          ..text = state.searchString
          ..selection = TextSelection.collapsed(offset: state.searchString.length);
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 0, top: 0, bottom: 0),
          child: CupertinoSearchTextField(
            autofocus: true,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            placeholder: "Search for recipes",
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: RecipeAppTheme.colors.pinkMedium, width: 1.5),

              // boxShadow: [RecipeAppTheme.shadows.wide],
            ),
            itemSize: 26,
            controller: searchController,
            prefixIcon: const Icon(
              Icons.search,
              size: 22,
            ),
            suffixIcon: const Icon(Icons.close_rounded),
            onSuffixTap: () {
              if (searchController.value.text.isEmpty) {
                Navigator.pop(context);
              } else {
                recipeListCubit.resetSearch();
                searchController.text = "";
              }
            },
            onSubmitted: ((value) async {
              if (value == "") {
                recipeListCubit.resetSearch();
              }
              if (value.isNotEmpty) {
                recipeListCubit.updateSearchString(value);
                recipeListCubit.getRecipes(state.categoryFilters);
              }
            }),
          ),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListCubit, RecipeListState>(
      builder: (context, state) {
        switch (state.listStatus) {
          case RecipeListStatus.initial:
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case RecipeListStatus.loading:
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case RecipeListStatus.loaded:
            final recipeList = state.recipeList;
            if (recipeList != null && recipeList.isNotEmpty) {
              return SliverRecipeList(recipeList: recipeList, tagFilters: state.tagFilters);
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: SearchError(text: "No recipes found 🥺"),
                ),
              );
            }

          default:
            return const SliverToBoxAdapter(child: Text("Error"));
        }
      },
    );
  }
}

class FilterChips extends StatefulWidget implements PreferredSizeWidget {
  FilterChips({
    Key? key,
    required size,
  })  : preferredSize = Size.fromHeight(size),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 330),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListCubit, RecipeListState>(
      builder: (context, state) {
        switch (state.tagStatus) {
          case TagStatus.initial:
            return const SizedBox();
          case TagStatus.loading:
            return const SizedBox();
          case TagStatus.loaded:
            final tags = state.tags;
            final List tagList = Set.from(tags!).toList();
            _animationController.forward();

            return AppBarFilterTags(
              tagList: tagList,
              animationController: _animationController,
              tagFilters: state.tagFilters,
              onSelect: BlocProvider.of<RecipeListCubit>(context).updateTagList,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class SortButton extends StatelessWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListCubit, RecipeListState>(
      builder: (context, state) {
        final recipeListCubit = BlocProvider.of<RecipeListCubit>(context);
        return IconButton(
          icon: const Icon(Icons.sort_rounded),
          onPressed: () => showMaterialModalBottomSheet(
            context: context,
            builder: (context) => BlocProvider.value(
              value: recipeListCubit,
              child: const SortModal(),
            ),
          ),
        );
      },
    );
  }
}

class SortModal extends StatelessWidget {
  const SortModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListCubit, RecipeListState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius15)),
          height: 320,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const SizedBox(
                height: 12,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SmallText(text: "Sort by:"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(
                height: 1,
              ),
              const SizedBox(
                height: 8,
              ),
              RadioListTile(
                visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const SmallText(
                  text: "Most favorited",
                  fontSize: FontSize.smallPlus,
                  color: Colors.black87,
                ),
                value: SortBy.favoritesDesc,
                groupValue: state.sort,
                onChanged: <SortBy>(value) {
                  changeSortMethod(context, value, state);
                },
              ),
              RadioListTile(
                visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const SmallText(
                  text: "New",
                  fontSize: FontSize.smallPlus,
                  color: Colors.black87,
                ),
                value: SortBy.newest,
                groupValue: state.sort,
                onChanged: <SortBy>(value) {
                  changeSortMethod(context, value, state);
                },
              ),
              RadioListTile(
                visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const SmallText(
                  text: "Oldest",
                  fontSize: FontSize.smallPlus,
                  color: Colors.black87,
                ),
                value: SortBy.oldest,
                groupValue: state.sort,
                onChanged: <SortBy>(value) {
                  changeSortMethod(context, value, state);
                },
              ),
              RadioListTile(
                visualDensity: const VisualDensity(horizontal: -2, vertical: -3),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: const SmallText(
                  text: "Least Liked",
                  fontSize: FontSize.smallPlus,
                  color: Colors.black87,
                ),
                value: SortBy.favoritesAsc,
                groupValue: state.sort,
                onChanged: <SortBy>(value) {
                  changeSortMethod(context, value, state);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const SmallText(
                  text: "CLOSE",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ]),
          ),
        );
      },
    );
  }

  void changeSortMethod(BuildContext context, value, RecipeListState state) {
    BlocProvider.of<RecipeListCubit>(context).updateSort(value);
    BlocProvider.of<RecipeListCubit>(context).getRecipes(state.categoryFilters);
    Navigator.pop(context);
  }
}
