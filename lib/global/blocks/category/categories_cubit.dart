import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({required CategoryRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(CategoriesState.initial());

  final CategoryRepository _categoriesRepository;

  getCategories() async {
    try {
      emit(state.copyWith(status: CategoriesStateStatus.loading));
      final errorOrCurrentUser = await _categoriesRepository.getCategoryList();
      errorOrCurrentUser.fold(
        (err) => emit(state.copyWith(status: CategoriesStateStatus.error)),
        (categoriesList) {
          emit(state.copyWith(status: CategoriesStateStatus.loaded, categories: categoriesList!));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: CategoriesStateStatus.error));
    }
  }
}
