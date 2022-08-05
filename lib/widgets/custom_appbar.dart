import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String? title;

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        print(Get.currentRoute);
        return AppBar(
          leading: Get.currentRoute == "/"
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
            if (state.index == 2 && Get.currentRoute == "/")
              IconButton(onPressed: () => authCubit.logout(), icon: const Icon(Icons.logout))
            else if (state.index != 2 && Get.currentRoute == "/")
              IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.recipeCreator.name);
                  },
                  icon: const Icon(Icons.add_box))
          ],
          title: widget.title == null ? Text(state.title) : Text(widget.title!),
        );
      },
    );
  }
}
