import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/recipe_list_page/cubit/recipe_list_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeListCubit(
        recipesRepository: context.read<RecipesRepository>(),
        categoryRepository: context.read<CategoryRepository>(),
      )
        ..getRecipes()
        ..getTags(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              scrolledUnderElevation: 0,
              title: LargeText(text: "Browse"),
              bottom: FilterChips(size: 100.0),
            ),
            const _Body(),
          ],
        ),
      ),
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
        final recipeListCubit = BlocProvider.of<RecipeListCubit>(context);

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

            return SliverList(recipeList: recipeList, recipeListCubit: recipeListCubit);

          default:
            return const SliverToBoxAdapter(child: Text("Error"));
        }
      },
    );
  }
}

class SliverList extends StatefulWidget {
  const SliverList({
    Key? key,
    required this.recipeList,
    required this.recipeListCubit,
  }) : super(key: key);

  final List<RecipeModel>? recipeList;
  final RecipeListCubit recipeListCubit;
  @override
  State<SliverList> createState() => _SliverListState();
}

class _SliverListState extends State<SliverList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          widget.recipeListCubit.state.listStatus != RecipeListStatus.loading) {
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
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      sliver: LiveSliverList(
          controller: _scrollController,
          itemCount: widget.recipeList!.length,
          showItemDuration: const Duration(milliseconds: 150),
          showItemInterval: const Duration(milliseconds: 50),
          itemBuilder: (context, index, animation) {
            final recipe = widget.recipeList![index];
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
  final List<String> recommendations = [
    "Lunch",
    "Breakfast",
    "Vegan",
    "Soup",
    "Gluten-free",
    "Egg-free",
    "Asian",
  ];
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // TODO: implement initState
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
      // buildWhen: (previous, current) {
      //   if (previous.tags == null) {
      //     return true;
      //   } else {
      //     return false;
      //   }
      // },
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

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  Wrap(
                    spacing: 8,
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: tagList.map((tag) {
                      final match = state.filters.indexWhere((filter) => filter.id == tag.id);
                      final status = match == -1 ? false : true;
                      return FadeTransition(
                        opacity: _animationController,
                        child: FilterChip(
                          selected: status,
                          showCheckmark: false,
                          label: SmallText(
                            text: tag.name,
                            color: Colors.black87,
                            size: 14,
                          ),
                          onSelected: ((status) {
                            BlocProvider.of<RecipeListCubit>(context).updateTagList(tag, status);
                          }),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
