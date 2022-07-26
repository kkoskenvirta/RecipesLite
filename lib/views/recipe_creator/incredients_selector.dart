import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/main/search_modal.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IncredientsSelector extends StatelessWidget {
  IncredientsSelector({Key? key, required this.incredients}) : super(key: key);
  List<IncredientModel> incredients = [];

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
          child: IncredientSheet(),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (incredients.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IncredientRow(
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
            itemCount: incredients.length,
          ),
        SizedBox(
          height: 12,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            surfaceTintColor: Theme.of(context).primaryColor,
          ),
          onPressed: () => showBottomSheet(),
          child: incredients.isEmpty ? const Text("ADD INCREDIENT") : const Text("ADD"),
        ),
      ],
    );
  }
}

class IncredientRow extends StatelessWidget {
  const IncredientRow({Key? key, required this.index}) : super(key: key);
  final int index;

  removeIncredient(context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    formDataCubit.removeIncredient(index);
  }

  void updateName(context, String name) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientName(index, name);
  }

  void updateAmount(context, String amount) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientAmount(index, amount);
  }

  void updateUnit(context, String unit) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientUnit(index, unit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final incredient = state.incredients[index];

        void showBottomSheet(int index, IncredientModel incredient) {
          final formDataCubit = BlocProvider.of<FormDataCubit>(context);
          showBarModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            builder: (context) => BlocProvider.value(
              value: formDataCubit,
              child: IncredientSheet(index: index, incredient: incredient),
            ),
          );
        }

        return Dismissible(
          key: Key("Item ${index}"),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => removeIncredient(context),
          dismissThresholds: const {DismissDirection.endToStart: 0.6},
          background: Container(
            color: Colors.pink.shade400,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.pink.shade50,
            ),
            child: ListTile(
              title: LargeText(
                text: incredient.name!,
                size: 16,
              ),
              subtitle: Text('${incredient.amount.toString()} ${incredient.unit}'),
              trailing: Icon(Icons.edit),
              onTap: () => showBottomSheet(index, incredient),
            ),
          ),
        );
      },
    );
  }
}

//Needs stateful for form validation
class IncredientSheet extends StatefulWidget {
  const IncredientSheet({Key? key, this.incredient, this.index}) : super(key: key);

  final IncredientModel? incredient;
  final int? index;

  @override
  State<IncredientSheet> createState() => _IncredientSheetState();
}

class _IncredientSheetState extends State<IncredientSheet> {
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

  final unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        unitController.text = widget.incredient != null ? widget.incredient!.unit.toString() : "gram";

        return Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Container(
            padding: EdgeInsets.all(Dimensions.height20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                LargeText(text: "Add an incredient"),
                SizedBox(
                  height: 16,
                ),
                Align(alignment: Alignment.centerLeft, child: SmallText(text: "Incredient name")),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(hintText: "Incredient", filled: false),
                  textInputAction: TextInputAction.next,
                  initialValue: widget.incredient != null ? widget.incredient!.name : "",
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
                Align(alignment: Alignment.centerLeft, child: SmallText(text: "Incredient amount")),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: const InputDecoration(
                          hintText: "amount",
                          filled: false,
                          helperText: "",
                        ),
                        initialValue: widget.incredient != null ? widget.incredient!.amount.toString() : "",
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        onChanged: (amount) {
                          this.amount = amount;
                        },
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Amount can't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        width: 70,
                        padding: EdgeInsets.only(bottom: 24),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            filled: false,
                          ),
                          value: widget.incredient != null ? widget.incredient!.unit : "gram",
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
                SizedBox(
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
                          child: Text("Cancel"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final isValidForm = formKey.currentState!.validate();
                          if (isValidForm) {
                            if (widget.index != null) {
                              BlocProvider.of<FormDataCubit>(context).updateIncredientName(widget.index!, name);
                              BlocProvider.of<FormDataCubit>(context).updateIncredientAmount(widget.index!, amount);
                              BlocProvider.of<FormDataCubit>(context).updateIncredientUnit(widget.index!, unit);
                            } else {
                              BlocProvider.of<FormDataCubit>(context).addIncredient(name, amount, unit);
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Save"),
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
