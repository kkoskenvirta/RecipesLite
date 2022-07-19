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
        emit(state.copyWith(index: 0, navBarItem: NavBarItem.home));
        break;
      case NavBarItem.browse:
        emit(state.copyWith(index: 1, navBarItem: NavBarItem.browse));
        break;
      default:
        emit(state.copyWith(index: 0, navBarItem: NavBarItem.home));
    }
  }
}
