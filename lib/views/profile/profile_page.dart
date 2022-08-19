import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';

import 'package:flutter_e_commerce/widgets/large_text.dart';
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
        child: BlocBuilder<UserDataCubit, UserDataState>(
            bloc: BlocProvider.of<UserDataCubit>(context)..getUserData(),
            builder: (context, state) {
              switch (state.status) {
                case UserDataStateStatus.loading:
                  return const ProfileBodySkeleton();

                case UserDataStateStatus.loaded:
                  return ProfileBody(
                    profile: state.currUser!,
                  );

                default:
                  return const SizedBox();
              }
            }),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.profile}) : super(key: key);
  final UserModel profile;

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
              text: profile.username,
              size: 22,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              title: const Text(
                "Favorites",
                textScaleFactor: 0.9,
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
              title: const Text(
                "Own recipes",
                textScaleFactor: 0.9,
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
              title: const Text(
                "Settings",
                textScaleFactor: 0.9,
              ),
              tileColor: Colors.pink.shade50,
              trailing: const Icon(Icons.chevron_right_rounded),
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
