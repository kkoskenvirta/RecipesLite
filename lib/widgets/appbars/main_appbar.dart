import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/single_recipe/cubit/single_recipe_cubit.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key, this.title, this.transparent = false, this.creator, this.editRecipe})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String? title;
  final bool transparent;

  final String? creator;
  final VoidCallback? editRecipe;

  @override
  final Size preferredSize;

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    final currentUser = BlocProvider.of<UserDataCubit>(context).state.currUser;

    final permission = widget.creator == currentUser?.id ? true : false;
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final router = AutoRouter.of(context);
    final transparent = widget.transparent;
    String path = router.currentPath;
    print(permission);

    print(path);
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: transparent ? Colors.transparent : null,
          shadowColor: transparent ? Colors.transparent : null,
          elevation: transparent ? 0 : null,
          leading: path == '/main'
              ? IconButton(
                  onPressed: () => showBarModalBottomSheet(
                    expand: true,
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (context) => const SearchModal(),
                  ),
                  icon: Icon(Icons.search),
                )
              : null,
          actions: [
            if (state.index == 2 && path == '/main')
              IconButton(onPressed: () => authCubit.logout(), icon: const Icon(Icons.logout))
            else if (state.index != 2 && path == '/main')
              IconButton(
                  onPressed: () {
                    router.push(RecipeCreator());
                  },
                  icon: const Icon(Icons.add_box))
            else if (path == "/recipe" && permission && widget.editRecipe != null)
              IconButton(onPressed: widget.editRecipe, icon: const Icon(Icons.add_box))
          ],
          title: widget.title == null ? Text(state.title) : Text(widget.title!),
        );
      },
    );
  }
}
