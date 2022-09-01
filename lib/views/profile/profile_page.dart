import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/confirm_dialog.dart';

import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';
import 'package:skeletons/skeletons.dart';
import '../../widgets/appbars/main_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  // final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Profile",
        showLogoutButton: true,
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
          switch (state.status) {
            case UserDataStateStatus.loading:
              return const ProfileBodySkeleton();

            case UserDataStateStatus.loaded:
              return ProfileBody(
                profile: state.user!,
              );

            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key, required this.profile}) : super(key: key);
  final UserModel profile;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LargeText(
              text: widget.profile.username,
              fontSize: FontSize.veryLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: const SmallText(
                text: "Favorites",
                fontSize: FontSize.smallPlus,
                color: Colors.black87,
              ),
              tileColor: Colors.pink.shade50,
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: (() {
                router.push(FavoritesRoute(listMode: ListMode.favorites.name));
              }),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: const SmallText(
                text: "Own recipes",
                fontSize: FontSize.smallPlus,
                color: Colors.black87,
              ),
              tileColor: Colors.pink.shade50,
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: (() {
                router.push(OwnedRoute(listMode: ListMode.owned.name));
              }),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: const SmallText(
                text: "Settings",
                fontSize: FontSize.smallPlus,
                color: Colors.black87,
              ),
              tileColor: Colors.pink.shade50,
              trailing: const Icon(Icons.chevron_right_rounded),
            ),
            const SizedBox(
              height: 24,
            ),
            ListTile(
              title: const SmallText(
                text: "Delete account",
                fontSize: FontSize.smallPlus,
                color: Colors.white,
              ),
              tileColor: RecipeAppTheme.colors.pinkAccent,
              trailing: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onTap: () async {
                final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
                bool shouldDelete = await showConfirmationDialog(
                  context: context,
                  title: "Delete user account",
                  text: "By pressing continue, your account will be deleted. This cannot be reverted.",
                  confirmText: "Delete Account",
                  declineText: "Cancel",
                );
                if (shouldDelete) {
                  await authCubit.delete(widget.profile.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBodySkeleton extends StatelessWidget {
  const ProfileBodySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SkeletonLine(
              style: SkeletonLineStyle(height: 30, width: 100),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 4,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                borderRadius: BorderRadius.circular(6),
                height: 44,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                borderRadius: BorderRadius.circular(6),
                height: 44,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SkeletonLine(
              style: SkeletonLineStyle(
                borderRadius: BorderRadius.circular(6),
                height: 44,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
