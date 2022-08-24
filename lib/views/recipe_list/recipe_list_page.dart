import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/recipe_list/cubit/recipe_list_cubit.dart';
import 'package:flutter_e_commerce/views/search/search_results.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_appbar_filter_tags.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_recipe_list.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeListCubit(
        recipesRepository: context.read<RecipesRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      )
        ..getRecipes()
        ..getTags(),
      child: BlocBuilder<RecipeListCubit, RecipeListState>(
        builder: (context, state) {
          final recipeListCubit = BlocProvider.of<RecipeListCubit>(context);

          return Scaffold(
            body: RecipeListScrollView(recipeListCubit: recipeListCubit),
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
  }) : super(key: key);
  final RecipeListCubit recipeListCubit;
  @override
  State<RecipeListScrollView> createState() => _RecipeListScrollViewState();
}

class _RecipeListScrollViewState extends State<RecipeListScrollView> {
  final ScrollController _scrollController = ScrollController();
  String title = "Recipe list";
  @override
  void initState() {
    final state = widget.recipeListCubit.state;
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          state.fetchingMore != RecipeListStatus.loading &&
          state.listStatus != RecipeListStatus.loading &&
          state.noMoreResults != true) {
        widget.recipeListCubit.getRecipes();
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
          floating: true,
          pinned: true,
          snap: true,
          scrolledUnderElevation: 0,
          title: LargeText(text: "Browse"),
          bottom: FilterChips(size: 148.0),
        ),
        const _Body(),
      ],
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
      duration: const Duration(milliseconds: 300),
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
