import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({
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
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final router = AutoRouter.of(context);

    return AppBar(
      backgroundColor: transparent ? Colors.transparent : null,
      shadowColor: transparent ? Colors.transparent : null,
      scrolledUnderElevation: elevation ? null : 0,
      automaticallyImplyLeading: showBackButton ? true : false,
      leading: showSearchButton
          ? null
          : showBackButton
              ? const AutoLeadingButton()
              : null,
      actions: [
        if (showLogoutButton)
          IconButton(onPressed: () => authCubit.logout(), icon: const Icon(Icons.logout))
        else if (showCreateButton)
          IconButton(
            onPressed: () {
              router.push(RecipeCreator());
            },
            icon: const Icon(
              Icons.add_box,
              size: 30,
            ),
          )
        else if (showCloseButton)
          TextButton(
            onPressed: () {
              router.pop();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(right: 8),
              ),
            ),
            child: const Text("Close"),
          )
      ],
      title: title == null
          ? const SizedBox()
          : LargeText(
              text: title!,
              fontSize: FontSize.large,
            ),
    );
  }
}
