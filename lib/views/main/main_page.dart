import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        CategoriesRouter(),
        SearchRouter(),
        ProfileRouter(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => _BottomNavigationItems(tabsRouter: tabsRouter),
    );
  }
}

class _BottomNavigationItems extends StatelessWidget {
  const _BottomNavigationItems({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return SalomonBottomBar(
          selectedItemColor: Colors.pink.shade400,
          currentIndex: tabsRouter.activeIndex,
          items: [
            SalomonBottomBarItem(
              activeIcon: const Icon(Icons.home_rounded),
              icon: const Icon(Icons.home_outlined),
              title: SmallText(text: "Home", color: RecipeAppTheme.colors.pinkAccent),
            ),
            SalomonBottomBarItem(
              activeIcon: const Icon(Icons.library_books),
              icon: const Icon(Icons.library_books_outlined),
              title: SmallText(text: "Browse", color: RecipeAppTheme.colors.pinkAccent),
            ),
            SalomonBottomBarItem(
              activeIcon: const Icon(Icons.search_rounded),
              icon: const Icon(Icons.search_rounded),
              title: SmallText(text: "Search", color: RecipeAppTheme.colors.pinkAccent),
            ),
            SalomonBottomBarItem(
              activeIcon: const Icon(Icons.account_circle),
              icon: const Icon(Icons.account_circle_outlined),
              title: SmallText(text: "Profile", color: RecipeAppTheme.colors.pinkAccent),
            ),
          ],
          onTap: (index) {
            if (index == tabsRouter.activeIndex) {
              //If currently selected tab is pressed again, pops back to root route
              switch (index) {
                case 0:
                  context.router.navigate(const HomeRoute());
                  break;
                case 1:
                  context.router.navigate(const CategoriesRoute());
                  break;
                case 2:
                  context.router.navigate(SearchRoute());
                  break;
                case 3:
                  context.router.navigate(const ProfileRoute());
                  break;
                default:
              }
            }
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
