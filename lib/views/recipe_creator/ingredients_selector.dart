import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IngredientsSelector extends StatelessWidget {
  const IngredientsSelector({Key? key, required this.ingredientGroups}) : super(key: key);
  final List<IngredientGroupModel> ingredientGroups;

  @override
  Widget build(BuildContext context) {
    void showMyBottomSheet(child) {
      final formDataCubit = BlocProvider.of<FormDataCubit>(context);
      showBarModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (context) => BlocProvider.value(
          value: formDataCubit,
          child: child,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (ingredientGroups.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IngredientGroup(
                    ingredientGroup: ingredientGroups[index],
                    groupIndex: index,
                  ),
                ],
              );
            },
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 16,
              );
            }),
            itemCount: ingredientGroups.length,
          ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            surfaceTintColor: Theme.of(context).primaryColor,
          ),
          onPressed: () => showMyBottomSheet(const IngredientGroupSheet()),
          child: SmallText(
            text: "ADD NEW GROUP",
            size: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class IngredientGroup extends StatelessWidget {
  const IngredientGroup({Key? key, required this.ingredientGroup, required this.groupIndex}) : super(key: key);
  final IngredientGroupModel ingredientGroup;
  final int groupIndex;

  _showConfirmationDialog(BuildContext context) async {
    final shouldPop = showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm to delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Do you wish to delete the ingredient group?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: SmallText(
                text: 'Delete',
                size: 14,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            ElevatedButton(
              child: SmallText(
                text: 'Cancel',
                size: 14,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
    return shouldPop;
  }

  @override
  Widget build(BuildContext context) {
    void showMyBottomSheet(child) {
      final formDataCubit = BlocProvider.of<FormDataCubit>(context);
      showBarModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (context) => BlocProvider.value(
          value: formDataCubit,
          child: child,
        ),
      );
    }

    return Column(
      children: [
        Dismissible(
          key: UniqueKey(),
          direction: groupIndex == 0 ? DismissDirection.none : DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            final bool shouldDelete = await _showConfirmationDialog(context);
            return shouldDelete;
          },
          onDismissed: (_) async {
            final FormDataCubit formDataCubit = BlocProvider.of<FormDataCubit>(context);
            formDataCubit.removeIngredientGroup(groupIndex: groupIndex);
          },
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
          child: InkWell(
            onLongPress: () {
              HapticFeedback.heavyImpact();
              showCupertinoModalPopup(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                        showMyBottomSheet(IngredientGroupSheet(
                          groupIndex: groupIndex,
                          ingredientGroup: ingredientGroup,
                        ));
                      },
                      child: const Text('Change group name'),
                    )
                  ],
                ),
              );
            },
            child: Card(
              elevation: 0,
              margin: const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              borderOnForeground: false,
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  backgroundColor: RecipeAppTheme.colors.pinkLightLow,
                  tilePadding: const EdgeInsets.only(bottom: 2, top: 2, left: 16, right: 4),
                  childrenPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  collapsedBackgroundColor: RecipeAppTheme.colors.pinkLightLow,
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add_box,
                      color: RecipeAppTheme.colors.pinkAccent,
                    ),
                    onPressed: () => showMyBottomSheet(IngredientSheet(groupIndex: groupIndex)),
                  ),
                  title: LargeText(
                    fontWeight: FontWeight.w500,
                    text: ingredientGroup.name,
                    color: Colors.black87,
                    size: 17,
                  ),
                  children: [
                    if (ingredientGroup.ingredients.isEmpty)
                      ListTile(
                        title: LargeText(
                          text: "Group is still empty",
                          size: 15,
                        ),
                        visualDensity: const VisualDensity(vertical: -2),
                        minVerticalPadding: 14,
                        subtitle: const Text('Add ingredients to the group by pressing +'),
                      ),
                    if (ingredientGroup.ingredients.isNotEmpty)
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              IngredientRow(
                                groupIndex: groupIndex,
                                ingredientIndex: index,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: ((context, index) {
                          return const SizedBox(
                            height: 0,
                          );
                        }),
                        itemCount: ingredientGroup.ingredients.length,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IngredientRow extends StatelessWidget {
  const IngredientRow({Key? key, required this.ingredientIndex, required this.groupIndex}) : super(key: key);
  final int groupIndex;
  final int ingredientIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final ingredient = state.ingredientGroups[groupIndex].ingredients[ingredientIndex];

        void showBottomSheet({required int groupIndex, int? ingredientIndex, IngredientModel? ingredient}) {
          final formDataCubit = BlocProvider.of<FormDataCubit>(context);
          showBarModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            builder: (context) => BlocProvider.value(
              value: formDataCubit,
              child: IngredientSheet(groupIndex: groupIndex, ingredientIndex: ingredientIndex, ingredient: ingredient),
            ),
          );
        }

        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => BlocProvider.of<FormDataCubit>(context)
              .removeIngredientFromGroup(groupIndex: groupIndex, ingredientIndex: ingredientIndex),
          dismissThresholds: const {DismissDirection.endToStart: 0.6},
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: RecipeAppTheme.colors.pinkAccent,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: RecipeAppTheme.colors.pinkLightLow,
            ),
            child: ListTile(
              title: LargeText(
                text: ingredient.name.capitalize(),
                size: 15,
              ),
              visualDensity: const VisualDensity(vertical: -2),
              minVerticalPadding: 14,
              subtitle: Text('${ingredient.amount.toString()} ${ingredient.unit}'),
              trailing: const Icon(
                Icons.edit,
                size: 24,
              ),
              onTap: () =>
                  showBottomSheet(groupIndex: groupIndex, ingredientIndex: ingredientIndex, ingredient: ingredient),
            ),
          ),
        );
      },
    );
  }
}

//Needs stateful for form validation
class IngredientSheet extends StatefulWidget {
  const IngredientSheet({Key? key, this.ingredient, this.ingredientIndex, required this.groupIndex}) : super(key: key);

  final IngredientModel? ingredient;
  final int groupIndex;
  final int? ingredientIndex;

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
  bool initialized = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  final unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("rerender");
    final FormDataCubit formDataCubit = BlocProvider.of<FormDataCubit>(context);

    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        return initialized == false;
      },
      builder: (context, state) {
        if (widget.ingredient != null && initialized == false) {
          name = widget.ingredient!.name;
          amount = widget.ingredient!.amount.toString();
          unit = widget.ingredient!.unit!;
          nameController.text = name;
          amountController.text = amount;
          unitController.text = unit;
        } else {
          nameController.text = name;
          amountController.text = amount;
          unitController.text = unit;
        }
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
                LargeText(text: widget.ingredient == null ? "Add an ingredient" : "Edit ingredient"),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: "Ingredient",
                    filled: false,
                  ),
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  autofocus: true,
                  onChanged: (text) {
                    name = text;
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
                          alignLabelWithHint: true,
                          labelText: "Amount",
                          filled: false,
                          helperText: "",
                        ),
                        controller: amountController,
                        textInputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (text) {
                          amount = text;
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
                      child: TextFormField(
                        controller: unitController,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          labelText: "Unit",
                          filled: false,
                          helperText: "",
                          hintText: "Unit",
                        ),
                        validator: ((value) => null),
                        readOnly: true,
                        onTap: () => showCupertinoModalPopup(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext builder) {
                            String text = unit;
                            return Container(
                              height: 290,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    child: CupertinoPicker(
                                        scrollController:
                                            FixedExtentScrollController(initialItem: unitOptions.indexOf(unit)),
                                        itemExtent: 36,
                                        children: unitOptions.map((unit) => Center(child: Text(unit))).toList(),
                                        onSelectedItemChanged: (index) {
                                          if (unitOptions[index] != text) {
                                            text = unitOptions[index];
                                          }
                                        }),
                                  ),
                                  const Divider(
                                    height: 8,
                                  ),
                                  CupertinoButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      unit = text;
                                      unitController.text = text;
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                            );
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
                            if (widget.ingredientIndex != null) {
                              formDataCubit.updateIngredientNameFromGroup(
                                groupIndex: widget.groupIndex,
                                ingredientIndex: widget.ingredientIndex!,
                                name: name,
                              );
                              formDataCubit.updateIngredientAmountFromGroup(
                                groupIndex: widget.groupIndex,
                                ingredientIndex: widget.ingredientIndex!,
                                amount: amount,
                              );
                              formDataCubit.updateIngredientUnitFromGroup(
                                groupIndex: widget.groupIndex,
                                ingredientIndex: widget.ingredientIndex!,
                                unit: unit,
                              );
                            } else {
                              formDataCubit.addIngredientToGroup(
                                  groupIndex: widget.groupIndex, name: name, amount: amount, unit: unit);
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

//Needs stateful for form validation
class IngredientGroupSheet extends StatefulWidget {
  const IngredientGroupSheet({Key? key, this.groupIndex, this.ingredientGroup}) : super(key: key);

  final int? groupIndex;
  final IngredientGroupModel? ingredientGroup;
  @override
  State<IngredientGroupSheet> createState() => _IngredientGroupSheetState();
}

class _IngredientGroupSheetState extends State<IngredientGroupSheet> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  String name = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        nameController.text = widget.ingredientGroup != null ? widget.ingredientGroup!.name : "";
        name = widget.ingredientGroup != null ? widget.ingredientGroup!.name : "";
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
                LargeText(
                    text: widget.ingredientGroup == null ? "Create an ingredient group" : "Edit ingredient group"),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Group name',
                    filled: false,
                  ),
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
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Cancel"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            if (widget.groupIndex != null) {
                              BlocProvider.of<FormDataCubit>(context)
                                  .updateIngredientGroupName(groupIndex: widget.groupIndex!, name: name);
                            } else {
                              BlocProvider.of<FormDataCubit>(context).addIngredientGroup(name);
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: SmallText(text: "Save", size: 14, color: Colors.white),
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
