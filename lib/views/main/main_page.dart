import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRouter(),
        CategoriesRouter(),
        ProfileRouter(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomNavigationItems(tabsRouter: tabsRouter),
    );
  }
}

class BottomNavigationItems extends StatelessWidget {
  const BottomNavigationItems({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final navigationCubit = BlocProvider.of<NavigationCubit>(context);

        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink.shade400,
          currentIndex: tabsRouter.activeIndex,
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
            tabsRouter.setActiveIndex(index);
          },
        );
      },
    );
  }
}
