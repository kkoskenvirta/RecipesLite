import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/search/search_results.dart';
import 'package:flutter_e_commerce/views/single_category/cubit/single_category_cubit.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_appbar_filter_tags.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/sliver_recipe_list/sliver_recipe_list.dart';

class SingleCategoryPage extends StatelessWidget {
  const SingleCategoryPage({
    Key? key,
    this.categoryFilters,
    @PathParam() required this.categoryId,
  }) : super(key: key);

  final List<CategoryModel>? categoryFilters;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleCategoryCubit(
        recipesRepository: context.read<RecipesRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      )
        ..getRecipes(categoryFilters)
        ..getTags(),
      child: BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
        builder: (context, state) {
          final singleCategoryCubit = BlocProvider.of<SingleCategoryCubit>(context);

          return Scaffold(
            body: SingleCategoryScrollView(singleCategoryCubit: singleCategoryCubit, categoryFilters: categoryFilters),
          );
        },
      ),
    );
  }
}

class SingleCategoryScrollView extends StatefulWidget {
  const SingleCategoryScrollView({
    Key? key,
    required this.singleCategoryCubit,
    this.categoryFilters,
  }) : super(key: key);
  final SingleCategoryCubit singleCategoryCubit;
  final List<CategoryModel>? categoryFilters;
  @override
  State<SingleCategoryScrollView> createState() => _SingleCategoryScrollViewState();
}

class _SingleCategoryScrollViewState extends State<SingleCategoryScrollView> {
  final ScrollController _scrollController = ScrollController();
  String title = "Recipe list";
  @override
  void initState() {
    final state = widget.singleCategoryCubit.state;
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          state.fetchingMore != SingleCategoryStatus.loading &&
          state.listStatus != SingleCategoryStatus.loading &&
          state.noMoreResults != true) {
        widget.singleCategoryCubit.getRecipes(widget.categoryFilters);
      }
    });

    if (widget.categoryFilters != null && widget.categoryFilters!.isNotEmpty) {
      title = widget.categoryFilters![0].name;
    }
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
          scrolledUnderElevation: 0,
          title: LargeText(text: widget.categoryFilters![0].name),
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
    return BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
      builder: (context, state) {
        switch (state.listStatus) {
          case SingleCategoryStatus.initial:
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case SingleCategoryStatus.loading:
            return const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case SingleCategoryStatus.loaded:
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
    return BlocBuilder<SingleCategoryCubit, SingleCategoryState>(
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
              onSelect: BlocProvider.of<SingleCategoryCubit>(context).updateTagList,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
