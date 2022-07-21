import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_fetch_cubit.freezed.dart';
part 'form_fetch_state.dart';

class FormFetchCubit extends Cubit<FormFetchState> {
  FormFetchCubit({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(FormFetchState.initial());

  final CategoryRepository _categoryRepository;

  getFieldOptions() async {
    try {
      emit(state.copyWith(status: FormFetchStateStatus.loading));
      final errorOrCurrentUser = await _categoryRepository.getCategoryList();
      errorOrCurrentUser.fold(
        (err) => emit(state.copyWith(status: FormFetchStateStatus.error)),
        (categoriesList) {
          emit(state.copyWith(status: FormFetchStateStatus.loaded, categories: categoriesList!));
        },
      );
    } catch (e) {
      emit(state.copyWith(status: FormFetchStateStatus.error));
    }
  }
}
