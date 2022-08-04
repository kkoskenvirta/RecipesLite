import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.navigationCubit, this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String? title;

  @override
  final Size preferredSize;

  final NavigationCubit navigationCubit;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return AppBar(
          leading: IconButton(
            onPressed: () => showBarModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.white,
              builder: (context) => const SearchModal(),
            ),
            icon: Icon(Icons.search),
          ),
          actions: [
            if (state.index != 2)
              IconButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.recipeCreator.name),
                  icon: const Icon(Icons.add_box))
            else
              IconButton(onPressed: () => authCubit.logout(), icon: const Icon(Icons.logout))
          ],
          title: widget.title == null ? Text(widget.navigationCubit.state.title) : Text(widget.title!),
        );
      },
    );
  }
}
