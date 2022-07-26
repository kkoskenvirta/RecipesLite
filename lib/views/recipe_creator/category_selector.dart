import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    void updateCategory(CategoryModel category, bool status) {
      BlocProvider.of<FormDataCubit>(context).updateCategoryList(category, status);
    }

    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final status = state.categories.contains(categories[index]);

                return Column(
                  children: [
                    CheckboxListTile(
                      title: Text(categories[index].name),
                      value: status,
                      onChanged: (status) => updateCategory(categories[index], status!),
                    ),
                  ],
                );
              },
              separatorBuilder: ((context, index) {
                return const Divider(height: 1);
              }),
              itemCount: categories.length,
            ),
          ],
        );
      },
    );
  }
}
