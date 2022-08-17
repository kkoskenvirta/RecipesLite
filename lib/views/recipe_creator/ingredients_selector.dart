import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IngredientsSelector extends StatelessWidget {
  const IngredientsSelector({Key? key, required this.ingredients}) : super(key: key);
  final List<IngredientModel> ingredients;

  @override
  Widget build(BuildContext context) {
    void showBottomSheet() {
      final formDataCubit = BlocProvider.of<FormDataCubit>(context);
      showBarModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (context) => BlocProvider.value(
          value: formDataCubit,
          child: const IngredientSheet(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ingredients.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientRow(
                    index: index,
                  ),
                ],
              );
            },
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 8,
              );
            }),
            itemCount: ingredients.length,
          ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            surfaceTintColor: Theme.of(context).primaryColor,
          ),
          onPressed: () => showBottomSheet(),
          child: ingredients.isEmpty
              ? SmallText(
                  text: "ADD Ingredient",
                  size: 14,
                  color: Colors.white,
                )
              : SmallText(
                  text: "ADD",
                  size: 14,
                  color: Colors.white,
                ),
        ),
      ],
    );
  }
}

class IngredientRow extends StatelessWidget {
  const IngredientRow({Key? key, required this.index}) : super(key: key);
  final int index;

  removeingredient(context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    formDataCubit.removeIngredient(index);
  }

  void updateName(context, String name) {
    BlocProvider.of<FormDataCubit>(context).updateIngredientName(index, name);
  }

  void updateAmount(context, String amount) {
    BlocProvider.of<FormDataCubit>(context).updateIngredientAmount(index, amount);
  }

  void updateUnit(context, String unit) {
    BlocProvider.of<FormDataCubit>(context).updateIngredientUnit(index, unit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final ingredient = state.ingredients[index];

        void showBottomSheet(int index, IngredientModel ingredient) {
          final formDataCubit = BlocProvider.of<FormDataCubit>(context);
          showBarModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            builder: (context) => BlocProvider.value(
              value: formDataCubit,
              child: IngredientSheet(index: index, ingredient: ingredient),
            ),
          );
        }

        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => removeingredient(context),
          dismissThresholds: const {DismissDirection.endToStart: 0.6},
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: RecipeAppTheme.colors.pinkAccent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xFFFCE4EC),
            ),
            child: ListTile(
              title: LargeText(
                text: ingredient.name.capitalize(),
                size: 16,
              ),
              visualDensity: const VisualDensity(vertical: -1),
              subtitle: Text('${ingredient.amount.toString()} ${ingredient.unit}'),
              trailing: const Icon(Icons.edit),
              onTap: () => showBottomSheet(index, ingredient),
            ),
          ),
        );
      },
    );
  }
}

//Needs stateful for form validation
class IngredientSheet extends StatefulWidget {
  const IngredientSheet({Key? key, this.ingredient, this.index}) : super(key: key);

  final IngredientModel? ingredient;
  final int? index;

  @override
  State<IngredientSheet> createState() => _IngredientSheetState();
}

class _IngredientSheetState extends State<IngredientSheet> {
  final List<String> unitOptions = [
    'gram',
    'kg',
    'ml',
    'dl',
    'l',
    'tbsp',
    'tsp',
  ];

  String name = "";
  String amount = "";
  String unit = "gram";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        nameController.text = widget.ingredient != null ? widget.ingredient!.name : "";
        amountController.text = widget.ingredient != null ? widget.ingredient!.amount.toString() : "";
        unitController.text = widget.ingredient != null ? widget.ingredient!.unit.toString() : "gram";
        name = widget.ingredient != null ? widget.ingredient!.name : "";
        amount = widget.ingredient != null ? widget.ingredient!.amount.toString() : "";
        unit = widget.ingredient != null ? widget.ingredient!.unit.toString() : "gram";

        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Container(
            height: 625,
            padding: EdgeInsets.all(Dimensions.height20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                LargeText(text: "Add an ingredient"),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(labelText: "Ingredient", filled: false),
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  autofocus: true,
                  onChanged: (name) {
                    this.name = name;
                  },
                  validator: (value) {
                    if (value != null && value.length < 4) {
                      return "Minimum 4 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          labelText: "Amount",
                          filled: false,
                          helperText: "",
                        ),
                        controller: amountController,
                        textInputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (amount) {
                          this.amount = amount;
                        },
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Amount can't be empty";
                          }
                          try {
                            double.parse(value!.replaceAll(',', '.'));
                          } catch (e) {
                            print(e);
                            return "Invalid amount";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        width: 70,
                        padding: const EdgeInsets.only(bottom: 30),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: "",
                            filled: false,
                          ),
                          value: widget.ingredient != null ? widget.ingredient!.unit : "gram",
                          items: unitOptions
                              .map((unit) => DropdownMenuItem(
                                    value: unit,
                                    child: Text(unit),
                                  ))
                              .toList(),
                          onChanged: (unit) {
                            this.unit = unit.toString();
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(height: 48.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 8.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            if (widget.index != null) {
                              BlocProvider.of<FormDataCubit>(context).updateIngredientName(widget.index!, name);
                              BlocProvider.of<FormDataCubit>(context).updateIngredientAmount(widget.index!, amount);
                              BlocProvider.of<FormDataCubit>(context).updateIngredientUnit(widget.index!, unit);
                            } else {
                              BlocProvider.of<FormDataCubit>(context).addIngredient(name, amount, unit);
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: SmallText(
                          text: "Save",
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
