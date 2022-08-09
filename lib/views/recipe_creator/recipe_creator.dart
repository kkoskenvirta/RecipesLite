import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/main/home_screen.dart';
import 'package:flutter_e_commerce/views/recipe_creator/category_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_fetch/form_fetch_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_stepper/stepper_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/difficulty_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/ingredients_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/review_slide.dart';
import 'package:flutter_e_commerce/views/recipe_creator/tag_selector.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/custom_stepper/custom_stepper.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class RecipeCreatorScreen extends StatelessWidget {
  const RecipeCreatorScreen({
    Key? key,
    this.title = "New recipe",
    this.editableRecipe,
  }) : super(key: key);
  final String title;
  final RecipeModel? editableRecipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: MainAppBar(title: title),
        body: SafeArea(
          child: Column(
            children: [
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
                  child: FormFetchScreenBody(
                    editableRecipe: editableRecipe,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormFetchScreenBody extends StatefulWidget {
  const FormFetchScreenBody({
    Key? key,
    this.editableRecipe,
  }) : super(key: key);
  final RecipeModel? editableRecipe;

  @override
  State<FormFetchScreenBody> createState() => _FormFetchScreenBodyState();
}

class _FormFetchScreenBodyState extends State<FormFetchScreenBody> {
  final nameFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();
  final instructionFieldController = TextEditingController();

  //Form validation keys
  final detailsKey = GlobalKey<FormState>();
  final ingredientsKey = GlobalKey<FormState>();

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

  @override
  void dispose() {
    nameFieldController.dispose();
    descriptionFieldController.dispose();
    instructionFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormFetchCubit, FormFetchState>(
      bloc: BlocProvider.of<FormFetchCubit>(context)
        ..getCategoryOptions()
        ..getTagOptions(),
      builder: (context, state) {
        final formDataCubit = BlocProvider.of<FormDataCubit>(context);
        // If editable recipe model is passed initialize state with that recipe
        formDataCubit.initializeEdit(widget.editableRecipe);

        nameFieldController.text = formDataCubit.state.name ?? "";
        descriptionFieldController.text = formDataCubit.state.shortDescription ?? "";
        instructionFieldController.text = formDataCubit.state.instructions;
        switch (state.status) {
          case FormFetchStateStatus.loading:
            return const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          case FormFetchStateStatus.loaded:
            // items for dropdowns
            final categories = state.categories;
            final tags = state.tags;
            return BlocBuilder<FormDataCubit, FormDataState>(
              builder: (context, state) {
                final formDataCubit = BlocProvider.of<FormDataCubit>(context);
                final editMode = formDataCubit.state.editMode;

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
                            final isValidForm = detailsKey.currentState!.validate();
                            if (isValidForm) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              stepperCubit.nextStep();
                            }
                          } else if (state.stepperItem == StepperItem.classification ||
                              state.stepperItem == StepperItem.ingredients) {
                            stepperCubit.nextStep();
                          }
                          if (state.stepperItem == StepperItem.review) {
                            final recipeFetchCubit = BlocProvider.of<RecipeFetchCubit>(context);
                            final userDataCubit = BlocProvider.of<UserDataCubit>(context);
                            final formDataCubit = BlocProvider.of<FormDataCubit>(context);

                            //Send upload mode so we know if we need to update an existing or create a new recipe
                            final router = AutoRouter.of(context);

                            final bool uploadCompleted =
                                await formDataCubit.submitRecipe(editMode!, widget.editableRecipe);

                            if (uploadCompleted) {
                              if (!mounted) return;
                              recipeFetchCubit.fetchHomePageRecipes();
                              userDataCubit.getUserData();
                              if (editMode) {
                                router.pop(formDataCubit.state.recipe);
                                _showToast(context);
                              } else {
                                router.popUntilRouteWithName(HomeRouter.name);

                                _showToast(context);
                              }

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
                            editMode: editMode!,
                          );
                        },
                        steps: <CustomStep>[
                          CustomStep(
                            title: SmallText(text: 'Details'),
                            content: Form(
                              key: detailsKey,
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
                                    onChanged: (text) => BlocProvider.of<FormDataCubit>(context).updateRecipeName(text),
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
                                    onChanged: (text) =>
                                        BlocProvider.of<FormDataCubit>(context).updateRecipeDescription(text),
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
                                    onChanged: (text) =>
                                        BlocProvider.of<FormDataCubit>(context).updateRecipeInstructions(text),
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
                            title: SmallText(text: 'Ingredients'),
                            content: Form(
                              key: ingredientsKey,
                              child: Column(
                                children: [
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Ingredient list")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  IngredientsSelector(ingredients: [...formDataCubit.state.ingredients]),
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
                              children: [
                                ReviewSlide(
                                  editableRecipe: widget.editableRecipe,
                                ),
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
      final ingredients = formDataState.ingredients;
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
          state = ingredients.isNotEmpty;
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
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
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
