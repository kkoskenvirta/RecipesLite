part of 'navigation_cubit.dart';

enum NavBarItem { home, categories, search, profile }

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required NavBarItem navBarItem,
    required int index,
    required String title,
    required String? currentPath,
  }) = _NavigationState;

  factory NavigationState.initial() {
    return const NavigationState(
      navBarItem: NavBarItem.home,
      index: 0,
      title: "Home",
      currentPath: '/main',
    );
  }
}
