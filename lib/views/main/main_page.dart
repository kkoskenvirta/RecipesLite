import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/views/main/categories/categories_screen.dart';
import 'package:flutter_e_commerce/views/main/home/home_screen.dart';
import 'package:flutter_e_commerce/views/profile/profile_screen.dart';
import 'package:flutter_e_commerce/widgets/custom_appbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationCubit = BlocProvider.of<NavigationCubit>(context);
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            navigationCubit: navigationCubit,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: BlocBuilder<RecipeFetchCubit, RecipeFetchState>(
            builder: (context, state) {
              switch (state.status) {
                case RecipeFetchStateStatus.initial:
                  return const Center(child: CircularProgressIndicator());
                case RecipeFetchStateStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case RecipeFetchStateStatus.error:
                  return const Text("Error happened");
                case RecipeFetchStateStatus.loaded:
                  return const StackedScreens();
                default:
                  return const Text("Error");
              }
            },
          ),
          bottomNavigationBar: BottomNavigationItems(navigationCubit: navigationCubit),
        );
      },
    );
  }
}

class StackedScreens extends StatelessWidget {
  const StackedScreens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return IndexedStack(
          index: state.index,
          children: const [
            HomeScreen(),
            CategoriesScreen(),
            ProfileScreen(),
          ],
        );
        // switch (state.navBarItem) {
        //   case NavBarItem.home:
        //     return const HomeScreen();
        //   case NavBarItem.categories:
        //     return const CategoriesScreen();
        //   case NavBarItem.profile:
        //     return const ProfileScreen();
        //   default:
        //     return const SizedBox();
        // }
      },
    );
  }
}

class BottomNavigationItems extends StatelessWidget {
  const BottomNavigationItems({
    Key? key,
    required this.navigationCubit,
  }) : super(key: key);

  final NavigationCubit navigationCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink.shade400,
          currentIndex: state.index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "Browse",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profile",
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              navigationCubit.getNavigationItem(NavBarItem.home);
            } else if (index == 1) {
              navigationCubit.getNavigationItem(NavBarItem.categories);
            } else if (index == 2) {
              navigationCubit.getNavigationItem(NavBarItem.profile);
            }
          },
        );
      },
    );
  }
}
