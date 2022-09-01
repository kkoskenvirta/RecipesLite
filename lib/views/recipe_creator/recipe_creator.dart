import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/views/recipe_creator/selectors/category_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_fetch/form_fetch_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_stepper/stepper_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/selectors/difficulty_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/selectors/ingredients_selector.dart';
import 'package:flutter_e_commerce/views/recipe_creator/review_slide.dart';
import 'package:flutter_e_commerce/views/recipe_creator/selectors/tag_selector.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/views/recipe_creator/stepper/custom_stepper.dart';
import 'package:flutter_e_commerce/widgets/confirm_dialog.dart';
import 'package:flutter_e_commerce/widgets/custom_toast.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

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
        appBar: MainAppBar(
          title: title,
          transparent: true,
        ),
        body: SafeArea(
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

                            //Send upload mode so we know if we need to update an existing or create a new recipes
                            final bool uploadCompleted =
                                await formDataCubit.submitRecipe(editMode!, widget.editableRecipe);

                            if (uploadCompleted) {
                              if (!mounted) return;
                              recipeFetchCubit.fetchHomePageRecipes();
                              userDataCubit.getUserData();
                              if (editMode) {
                                Navigator.pop(context, formDataCubit.state.recipe);
                                const CustomToast().showToast(
                                  context: context,
                                  message: "Changes saved succesfully!",
                                  icon: const Icon(Icons.check_circle_outline_rounded, size: 28),
                                );
                              } else {
                                if (!mounted) return;
                                Navigator.pop(context);
                                const CustomToast().showToast(
                                  context: context,
                                  message: "Recipe submitted for review!",
                                  icon: const Icon(Icons.check_circle_outline_rounded, size: 28),
                                );
                              }
                            }
                          }
                        },
                        onStepCancel: () async {
                          if (state.index == 0) {
                            final bool shouldPop = await showConfirmationDialog(
                              context: context,
                              title: "Discard changes",
                              text: "Current changes done to the recipe will be lost, do you wish to quit?",
                              confirmText: "Quit",
                              declineText: "Stay",
                            );
                            if (!mounted) return;
                            shouldPop ? Navigator.pop(context) : null;
                          }
                          stepperCubit.previousStep();
                        },
                        controlsBuilder: (context, details) {
                          final ColorScheme colorScheme = Theme.of(context).colorScheme;
                          const OutlinedBorder buttonShape = RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          detailsStep(context, state),
                          ingredientsStep(formDataCubit, state),
                          categorizationStep(tags, categories, state),
                          reviewStep(state)
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

  CustomStep detailsStep(BuildContext context, StepperState state) {
    return CustomStep(
      title: const SmallText(text: 'Details'),
      content: Form(
        key: detailsKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: <Widget>[
            const Align(alignment: Alignment.centerLeft, child: SmallText(text: "Recipe name (min 4 characters)")),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Recipe name"),
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
            const SizedBox(height: 20),
            const Align(
                alignment: Alignment.centerLeft, child: SmallText(text: "Recipe description (min 8 characters)")),
            const SizedBox(height: 6),
            TextFormField(
              decoration: const InputDecoration(hintText: "Recipe description"),
              textInputAction: TextInputAction.next,
              onChanged: (text) => BlocProvider.of<FormDataCubit>(context).updateRecipeDescription(text),
              controller: descriptionFieldController,
              validator: (value) {
                if (value != null && value.length < 4) {
                  return 'Minimun description length is 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: SmallText(text: "Difficulty and time")),
            const SizedBox(height: 6),
            DifficultySelector(),
            const SizedBox(height: 20),
            const Align(alignment: Alignment.centerLeft, child: SmallText(text: "Instructions (min 20 characters)")),
            const SizedBox(
              height: 6,
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: "Instructions on how to prepare the recipe",
              ),
              onChanged: (text) => BlocProvider.of<FormDataCubit>(context).updateRecipeInstructions(text),
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
    );
  }

  CustomStep ingredientsStep(FormDataCubit formDataCubit, StepperState state) {
    return CustomStep(
      title: const SmallText(text: 'Ingredients'),
      content: Form(
        key: ingredientsKey,
        child: Column(
          children: [
            IngredientsSelector(ingredientGroups: [...formDataCubit.state.ingredientGroups]),
          ],
        ),
      ),
      isActive: state.index >= 1,
      state: state.index >= 1 ? CustomStepState.complete : CustomStepState.disabled,
    );
  }

  CustomStep categorizationStep(List<TagModel> tags, List<CategoryModel> categories, StepperState state) {
    return CustomStep(
      title: const SmallText(text: 'Categories'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Align(alignment: Alignment.centerLeft, child: SmallText(text: "Special dietary")),
          const SizedBox(
            height: 6,
          ),
          Align(alignment: Alignment.centerLeft, child: TagSelector(tags: tags)),
          const SizedBox(
            height: 20,
          ),
          const Align(alignment: Alignment.centerLeft, child: SmallText(text: "Categorize your recipe")),
          const SizedBox(
            height: 6,
          ),
          CategorySelector(categories: categories),
        ],
      ),
      isActive: state.index >= 2,
      state: state.index >= 2 ? CustomStepState.complete : CustomStepState.disabled,
    );
  }

  CustomStep reviewStep(StepperState state) {
    return CustomStep(
      title: const SmallText(text: 'Review'),
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
    bool isDark() {
      return Theme.of(context).brightness == Brightness.dark;
    }

    validateStep(int currentStep) {
      final formDataState = BlocProvider.of<FormDataCubit>(context).state;
      final ingredientGroups = formDataState.ingredientGroups;
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
          state = ingredientGroups[0].ingredients.isNotEmpty;
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
          border: Border(
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
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.comfortable,
                ),
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
                        : (isDark() ? colorScheme.onSurface : RecipeAppTheme.colors.pinkLightLow);
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                    return isDark() || states.contains(MaterialState.disabled)
                        ? RecipeAppTheme.colors.pinkLightLow
                        : colorScheme.primary;
                  }),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
                  shape: MaterialStateProperty.all<OutlinedBorder>(buttonShape),
                ),
                child: details.currentStep < 3
                    ? const SmallText(
                        text: "Continue",
                        color: Colors.white,
                        fontSize: FontSize.smallPlus,
                      )
                    : BlocBuilder<FormDataCubit, FormDataState>(
                        builder: (context, state) {
                          switch (state.requestStatus) {
                            case DirectusRequestStatus.initial:
                              return editMode
                                  ? const SmallText(
                                      text: "Save",
                                      fontSize: FontSize.smallPlus,
                                      color: Colors.white,
                                    )
                                  : const SmallText(
                                      text: "Submit",
                                      fontSize: FontSize.smallPlus,
                                      color: Colors.white,
                                    );
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
                                child: Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                ),
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
