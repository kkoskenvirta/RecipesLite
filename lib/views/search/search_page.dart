import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/main/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/views/search/search_results.dart';
import 'package:flutter_e_commerce/widgets/appbars/sliver_search_appbar.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  // This key will be associated with the amber box
  final GlobalKey _searchFieldKey = GlobalKey();
  bool animateChip = false;
  // Coordinates
  double? _chipX, _chipY, _searchFieldX, _searchFieldY;
  String? _chipName;

  // This function is called when the user presses the floating button
  _getOffsets(GlobalKey? chipKey, GlobalKey searchFieldKey, String chipName) async {
    RenderBox? chip = chipKey!.currentContext?.findRenderObject() as RenderBox?;
    Offset? chipPosition = chip?.localToGlobal(Offset.zero);
    RenderBox? searchField = searchFieldKey.currentContext?.findRenderObject() as RenderBox?;
    Offset? searchFieldPosition = searchField?.localToGlobal(Offset.zero);

    if (chipPosition != null && searchFieldPosition != null) {
      setCoordinates(chipPosition.dx, chipPosition.dy, searchFieldPosition.dx, searchFieldPosition.dy, chipName);
      setState(() {
        _chipX = chipPosition.dx;
        _chipY = chipPosition.dy;
        _searchFieldX = searchFieldPosition.dx;
        _searchFieldY = searchFieldPosition.dy;
        _chipName = chipName;
      });
      Timer(const Duration(milliseconds: 125), () {
        print(_chipY);
        animate();
        Timer(const Duration(milliseconds: 125), () {
          setState(() {
            animateChip = false;
          });
        });
      });
    }
  }

  setCoordinates(double chipX, double chipY, double searchFieldX, double searchFieldY, String chipName) async {
    setState(() {
      _chipX = chipX;
      _chipY = chipY;
      _searchFieldX = searchFieldX;
      _searchFieldY = searchFieldY;
      _chipName = chipName;
    });
  }

  animate() async {
    setState(() {
      animateChip = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('render');
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverSearchAppBar(
                  searchFieldKey: _searchFieldKey,
                  title: "Search",
                  showBackButton: true,
                  elevation: false,
                  size: 50,
                ),
                SearchResultList(animateMethod: _getOffsets, searchFieldKey: _searchFieldKey),
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          key: const Key('animationChip'),
          curve: Curves.easeIn,
          top: animateChip ? _searchFieldY! - 2 : _chipY,
          left: animateChip ? _searchFieldX! + 30 : _chipX,
          duration: const Duration(milliseconds: 125),
          child: IgnorePointer(
            child: Material(
              color: Colors.transparent,
              child: Opacity(
                opacity: animateChip ? 0.25 : 0.0,
                child: Chip(
                  backgroundColor: animateChip ? RecipeAppTheme.colors.pinkLightPlus : Colors.transparent,
                  label: SmallText(
                    text: _chipName ?? "-",
                    color: animateChip ? Colors.black87 : Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
