import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';

class CustomToast {
  const CustomToast({
    Key? key,
  });
  void showToast({required BuildContext context, required String message, Icon? icon, Duration? duration}) {
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(Dimensions.radius15),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 18),
      boxShadows: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          spreadRadius: 2,
          blurRadius: 2,
        )
      ],
      icon: icon,
      messageText: LargeText(
        text: message,
        fontSize: FontSize.medium,
      ),
      backgroundColor: RecipeAppTheme.colors.pinkLightLow,
      duration: duration ?? Duration(seconds: 1, milliseconds: 500),
    ).show(context);
  }
}
