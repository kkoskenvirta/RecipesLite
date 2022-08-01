import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/recipe_creator/category_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_fetch/form_fetch_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_stepper/stepper_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/difficulty_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/incredients_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/review_slide.dart';
import 'package:flutter_e_commerce/views/recipe_creator/tag_selector.dart';
import 'package:flutter_e_commerce/widgets/custom_stepper/custom_stepper.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class RecipeCreatorScreen extends StatelessWidget {
  const RecipeCreatorScreen({
    Key? key,
    this.editableRecipe,
    this.title = "New recipe",
  }) : super(key: key);

  final RecipeModel? editableRecipe;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              FormFetchHeader(title: title),
              const SizedBox(
                height: 0,
              ),
              Flexible(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => FormFetchCubit(categoryRepository: context.read<CategoryRepository>()),
                    ),
                    BlocProvider(
                      create: (context) => FormDataCubit(recipesRepository: context.read<RecipesRepository>()),
                    ),
                  ],
                  child: FormFetchScreenBody(editableRecipe: editableRecipe),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormFetchHeader extends StatelessWidget {
  const FormFetchHeader({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Header(
      title: title,
      showTrailingButton: false,
      onLeadingButtonPressed: () => Navigator.pop(context),
      leadingButtonIcon: const Icon(Icons.chevron_left),
    );
  }
}

class FormFetchScreenBody extends StatefulWidget {
  const FormFetchScreenBody({Key? key, this.editableRecipe}) : super(key: key);
  final RecipeModel? editableRecipe;

  @override
  State<FormFetchScreenBody> createState() => _FormFetchScreenBodyState();
}

class _FormFetchScreenBodyState extends State<FormFetchScreenBody> {
  void _showToast(BuildContext context) {
    String message;
    Icon icon;
    Color backgroundColor;

    message = "Recipe submitted for review!";
    icon = const Icon(Icons.check_circle_outline_rounded, size: 28);
    backgroundColor = Colors.pink.shade50;

    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 18),
      boxShadows: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.125),
          spreadRadius: 4,
          blurRadius: 4,
        )
      ],
      icon: icon,
      messageText: LargeText(
        text: message,
        size: 15,
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2, milliseconds: 500),
    ).show(context);
  }

// If editable recipe model is passed initialize state with those values
  final nameFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();
  final instructionFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    bool editMode = false;
    if (widget.editableRecipe != null) {
      formDataCubit.initializeEdit(widget.editableRecipe!);
      editMode = true;
    }

    nameFieldController.text = formDataCubit.state.name ?? "";
    descriptionFieldController.text = formDataCubit.state.shortDescription ?? "";
    instructionFieldController.text = formDataCubit.state.instructions;

    final List<GlobalKey<FormState>> _stepKeys = [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
    ];

    return BlocBuilder<FormFetchCubit, FormFetchState>(
      bloc: BlocProvider.of<FormFetchCubit>(context)
        ..getCategoryOptions()
        ..getTagOptions(),
      builder: (context, state) {
        void updateName(String text) {
          BlocProvider.of<FormDataCubit>(context).updateRecipeName(text);
        }

        void updateDescription(String text) {
          BlocProvider.of<FormDataCubit>(context).updateRecipeDescription(text);
        }

        void updateInstructions(String text) {
          BlocProvider.of<FormDataCubit>(context).updateRecipeInstructions(text);
        }

        void updateDifficulty(String text) {
          BlocProvider.of<FormDataCubit>(context).updateRecipeDifficulty(text);
        }

        switch (state.status) {
          case FormFetchStateStatus.loading:
            return const CircularProgressIndicator();
          case FormFetchStateStatus.loaded:
            // items for dropdowns
            final categories = state.categories;
            final tags = state.tags;
            return BlocBuilder<FormDataCubit, FormDataState>(
              builder: (context, state) {
                return BlocProvider(
                  create: (context) => StepperCubit(),
                  child: BlocBuilder<StepperCubit, StepperState>(
                    builder: (context, state) {
                      final stepperCubit = BlocProvider.of<StepperCubit>(context);

                      return CustomStepper(
                        elevation: 1,
                        type: CustomStepperType.horizontal,
                        currentStep: state.index,
                        onStepTapped: (index) {
                          if (index <= state.index) {
                            stepperCubit.goToStep(index);
                          }
                        },
                        onStepContinue: () async {
                          if (state.stepperItem == StepperItem.details) {
                            final isValidForm = _stepKeys[state.index].currentState!.validate();
                            if (isValidForm) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              stepperCubit.nextStep();
                            }
                          } else if (state.stepperItem == StepperItem.classification ||
                              state.stepperItem == StepperItem.incredients) {
                            stepperCubit.nextStep();
                          }
                          if (state.stepperItem == StepperItem.review) {
                            final navigator = Navigator.of(context);
                            final recipeFetchCubit = BlocProvider.of<RecipeFetchCubit>(context);

                            //Send upload mode so we know if we need to update an existing or create a new recipe
                            final bool uploadCompleted =
                                await BlocProvider.of<FormDataCubit>(context).submitRecipe(editMode);

                            if (uploadCompleted) {
                              if (!mounted) return;
                              recipeFetchCubit.fetchHomePageRecipes();
                              navigator.pop();
                              _showToast(context);
                              //Get new created recipe and route to the recipe
                              // navigator.popAndPushNamed(Routes.recipe.name, arguments: )
                            }
                          }
                        },
                        onStepCancel: () {
                          if (state.index == 0) {
                            Navigator.pop(context);
                          }
                          stepperCubit.previousStep();
                        },
                        controlsBuilder: (context, details) {
                          final ColorScheme colorScheme = Theme.of(context).colorScheme;
                          const OutlinedBorder buttonShape = RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          );
                          const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16.0);
                          return CustomStepperControls(
                            colorScheme: colorScheme,
                            buttonPadding: buttonPadding,
                            buttonShape: buttonShape,
                            details: details,
                            editMode: editMode,
                          );
                        },
                        steps: <CustomStep>[
                          CustomStep(
                            title: SmallText(text: 'Details'),
                            content: Form(
                              key: _stepKeys[0],
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                children: <Widget>[
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: SmallText(text: "Recipe name (min 4 characters)")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Recipe name",
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onChanged: (text) => updateName(text),
                                    controller: nameFieldController,
                                    validator: (value) {
                                      if (value != null && value.length < 4) {
                                        return 'Minimun name length is 4 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: SmallText(text: "Recipe description (min 8 characters)")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Recipe description",
                                    ),
                                    textInputAction: TextInputAction.next,
                                    onChanged: (text) => updateDescription(text),
                                    controller: descriptionFieldController,
                                    validator: (value) {
                                      if (value != null && value.length < 4) {
                                        return 'Minimun description length is 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Difficulty and time")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  DifficultySelector(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: SmallText(text: "Instructions (min 20 characters)")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    maxLines: 8,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: "Instructions on how to prepare the recipe",
                                    ),
                                    onChanged: (text) => updateInstructions(text),
                                    controller: instructionFieldController,
                                    validator: (value) {
                                      if (value != null && value.length < 4) {
                                        return 'Minimun instruction length is 20 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            isActive: state.index >= 0,
                            state: state.index >= 0 ? CustomStepState.complete : CustomStepState.disabled,
                          ),
                          CustomStep(
                            title: SmallText(text: 'Incredients'),
                            content: Form(
                              key: _stepKeys[1],
                              child: Column(
                                children: [
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Incredient list")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  IncredientsSelector(incredients: [...formDataCubit.state.incredients]),
                                ],
                              ),
                            ),
                            isActive: state.index >= 1,
                            state: state.index >= 1 ? CustomStepState.complete : CustomStepState.disabled,
                          ),
                          CustomStep(
                            title: SmallText(text: 'Categories'),
                            content: Column(
                              children: [
                                Align(alignment: Alignment.centerLeft, child: SmallText(text: "Special dietary")),
                                const SizedBox(
                                  height: 6,
                                ),
                                TagSelector(
                                  tags: tags,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft, child: SmallText(text: "Categorize your recipe")),
                                const SizedBox(
                                  height: 6,
                                ),
                                CategorySelector(categories: categories),
                              ],
                            ),
                            isActive: state.index >= 2,
                            state: state.index >= 2 ? CustomStepState.complete : CustomStepState.disabled,
                          ),
                          CustomStep(
                            title: SmallText(text: 'Review'),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                ReviewSlide(),
                              ],
                            ),
                            isActive: state.index >= 3,
                            state: state.index >= 3 ? CustomStepState.complete : CustomStepState.disabled,
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class CustomStepperControls extends StatelessWidget {
  const CustomStepperControls({
    Key? key,
    required this.colorScheme,
    required this.buttonPadding,
    required this.buttonShape,
    required this.details,
    required this.editMode,
  }) : super(key: key);

  final ColorScheme colorScheme;
  final EdgeInsets buttonPadding;
  final OutlinedBorder buttonShape;
  final CustomControlsDetails details;
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    bool _isDark() {
      return Theme.of(context).brightness == Brightness.dark;
    }

    validateStep(int currentStep) {
      final formDataState = BlocProvider.of<FormDataCubit>(context).state;
      final incredients = formDataState.incredients;
      final categories = formDataState.categories;
      final name = formDataState.name;
      final description = formDataState.shortDescription;
      final instructions = formDataState.instructions;
      final time = formDataState.preparationTime;

      switch (currentStep) {
        case 0:
          bool state = name != null &&
              name.length >= 4 &&
              description != null &&
              description.length >= 8 &&
              instructions.length >= 20 &&
              time != null;

          return state;
        case 1:
          bool state;
          state = incredients.isNotEmpty;
          return state;
        case 2:
          bool state;
          state = categories.isNotEmpty;
          return state;
        case 3:
          return true;
        default:
          return false;
      }
    }

    return Container(
      decoration: const BoxDecoration(
          border: const Border(
        top: BorderSide(width: 1, color: Colors.black12),
      )),
      margin: const EdgeInsets.only(top: 0.0),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(
          height: 48.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: TextButton(
                onPressed: details.onStepCancel,
                child: details.currentStep > 0 ? const Text("Previous") : const Text("Cancel"),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48, minWidth: 140),
              child: TextButton(
                onPressed: validateStep(details.currentStep) ? details.onStepContinue : null,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : (_isDark() ? colorScheme.onSurface : colorScheme.onPrimary);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                    return _isDark() || states.contains(MaterialState.disabled) ? null : colorScheme.primary;
                  }),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
                  shape: MaterialStateProperty.all<OutlinedBorder>(buttonShape),
                ),
                child: details.currentStep < 3
                    ? const Text("Continue")
                    : BlocBuilder<FormDataCubit, FormDataState>(
                        builder: (context, state) {
                          switch (state.requestStatus) {
                            case DirectusRequestStatus.initial:
                              return editMode ? const Text("Save") : const Text("Submit");
                            case DirectusRequestStatus.loading:
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            case DirectusRequestStatus.loaded:
                              return const Center(
                                child: Icon(Icons.check_circle_outline),
                              );

                            default:
                              return const SizedBox();
                          }
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepperBottomBar extends StatelessWidget {
  const StepperBottomBar({Key? key, required this.onStepCancel, required this.onStepContinue}) : super(key: key);

  final VoidCallback onStepCancel;
  final VoidCallback onStepContinue;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          surfaceTintColor: Theme.of(context).primaryColor,
        ),
        label: const Text("ADD"),
        icon: const Icon(Icons.add),
        onPressed: () => onStepCancel(),
      ),
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          surfaceTintColor: Theme.of(context).primaryColor,
        ),
        label: const Text("ADD"),
        icon: const Icon(Icons.add),
        onPressed: () => onStepContinue(),
      ),
    ]);
  }
}
