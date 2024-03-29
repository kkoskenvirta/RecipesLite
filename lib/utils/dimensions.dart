import 'package:flutter/material.dart';

class Dimensions {
  static Size size = WidgetsBinding.instance.window.physicalSize;
  static double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  static double screenWidth = size.width / ratio;
  static double screenHeight = size.height / ratio;
  // static double screenWidth = size.width;

  static double pageView = screenHeight / 2.65;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height45 = screenHeight / 18.75;

  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.75;

  static double font20 = screenHeight / 42.2;

  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.3;

  static double listViewImgSize = screenWidth / 3.35;

  static double categoryListImgSize = screenWidth / 6.5;

  static double avatarImgSize = screenHeight / 3;
  static double recipeImgSize = screenHeight / 2;
  static double recipeCreatorImgSize = screenHeight / 3.25;
}
