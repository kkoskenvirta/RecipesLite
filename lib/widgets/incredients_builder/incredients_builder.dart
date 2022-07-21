import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class IncredientsBuilder extends StatelessWidget {
  IncredientsBuilder({Key? key, required this.incredients}) : super(key: key);
  List<IncredientModel> incredients = [];

  addIncredient(context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    formDataCubit.addIncredient();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(children: [IncredientRow(index: index)]);
          },
          separatorBuilder: ((context, index) {
            return const SizedBox(
              height: 8,
            );
          }),
          itemCount: incredients.length,
        ),
        SizedBox(
          height: 8,
        ),
        ElevatedButton(
            onPressed: () {
              addIncredient(context);
            },
            child: const Text("Add incredients"))
      ],
    );
  }
}

class IncredientRow extends StatefulWidget {
  IncredientRow({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<IncredientRow> createState() => _IncredientRowState();
}

class _IncredientRowState extends State<IncredientRow> {
  final List<String> unitOptions = [
    'gram',
    'kg',
    'ml',
    'dl',
    'l',
    'tbsp',
    'tsp',
  ];

  removeIncredient(context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    formDataCubit.removeIncredient(widget.index);
  }

  void updateName(context, String name) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientName(widget.index, name);
  }

  void updateAmount(context, String amount) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientAmount(widget.index, amount);
  }

  void updateUnit(context, String unit) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientUnit(widget.index, unit);
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormDataCubit, FormDataState>(
        listener: (BuildContext context, FormDataState state) {
          // if (state.incredients[widget.index] != _nameController.text) {
          //   _nameController.text = state.incredients[widget.index].name!;
          //   _nameController.selection = TextSelection.collapsed(offset: state.incredients[widget.index].name!.length);
          // }
        },
        child: Dismissible(
          key: Key('item ${widget.index}'),
          direction: widget.index > 0 ? DismissDirection.endToStart : DismissDirection.none,
          onDismissed: (_) => removeIncredient(context),
          dismissThresholds: const {DismissDirection.endToStart: 0.6},
          background: Container(
            color: Colors.pink.shade400,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Incredient",
                      filled: false,
                    ),
                    controller: _nameController,
                    onChanged: (name) => updateName(context, name),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "amount",
                      filled: false,
                    ),
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    onChanged: (amount) => updateAmount(context, amount),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                BlocBuilder<FormDataCubit, FormDataState>(
                  builder: (context, state) {
                    return Container(
                      width: 70,
                      child: DropdownButtonFormField<String>(
                        value: state.incredients[widget.index].unit,
                        decoration: InputDecoration(
                          filled: false,
                        ),
                        items: unitOptions
                            .map((unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit),
                                ))
                            .toList(),
                        onChanged: (unit) => updateUnit(context, unit.toString()),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
