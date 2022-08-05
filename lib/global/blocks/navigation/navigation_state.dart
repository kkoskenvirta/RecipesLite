part of 'navigation_cubit.dart';

enum NavBarItem { home, categories, profile }

@freezed
class NavigationState with _$NavigationState {
  const factory NavigationState({
    required NavBarItem navBarItem,
    required int index,
    required String title,
  }) = _NavigationState;

  factory NavigationState.initial() {
    return const NavigationState(
      navBarItem: NavBarItem.home,
      index: 0,
      title: "Home",
    );
  }
}
