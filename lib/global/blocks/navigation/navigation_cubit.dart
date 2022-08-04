import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.dart';
part 'navigation_cubit.freezed.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  getNavigationItem(NavBarItem navigationItem) {
    switch (navigationItem) {
      case NavBarItem.home:
        emit(state.copyWith(index: 0, navBarItem: NavBarItem.home, title: "Home"));
        break;
      case NavBarItem.categories:
        emit(state.copyWith(index: 1, navBarItem: NavBarItem.categories, title: "Categories"));
        break;
      case NavBarItem.profile:
        emit(state.copyWith(index: 2, navBarItem: NavBarItem.profile, title: "Profile"));
        break;
      default:
        emit(state.copyWith(index: 0, navBarItem: NavBarItem.home, title: "Home"));
    }
  }
}
