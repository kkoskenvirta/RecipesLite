import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/views/main/categories/categories_screen.dart';
import 'package:flutter_e_commerce/views/main/categories/categories_screen.dart';
import 'package:flutter_e_commerce/views/main/home/home_screen.dart';
import 'package:flutter_e_commerce/views/profile/profile_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationCubit = BlocProvider.of<NavigationCubit>(context);

    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
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
                  return BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      switch (state.navBarItem) {
                        case NavBarItem.home:
                          return HomeScreen();

                        case NavBarItem.categories:
                          return CategoriesScreen();
                        case NavBarItem.profile:
                          return ProfileScreen();

                        default:
                          return SizedBox();
                      }
                    },
                  );
                default:
                  return const Text("Error");
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
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
          ),
        );
      },
    );
  }
}
