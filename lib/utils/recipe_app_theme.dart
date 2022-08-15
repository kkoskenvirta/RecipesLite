import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/color_generator.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeAppTheme {
  static final colors = AppColors();
  static final shadows = AppShadows();
  ThemeData themeData = ThemeData(
    splashFactory: NoSplash.splashFactory,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        decorationColor: colors.pinkMediumPlus,
      ),
      filled: true,
      fillColor: colors.pinkLightLow,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: colors.pinkLight,
      scrolledUnderElevation: 5,
      shadowColor: colors.pinkMedium,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: colors.pinkAccent),
    ),

    canvasColor: colors.pinkLight,
    listTileTheme: ListTileThemeData(
      visualDensity: const VisualDensity(vertical: -3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colors.pinkLightLow,
      selectedColor: colors.pinkAccent,
      elevation: 0.5,
      pressElevation: 3,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: colors.pinkAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(
      color: colors.pinkAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        // surfaceTintColor: Colors.pink.shade400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(),
    // primarySwatch: Palette.pToLight,
    primarySwatch: createMaterialColor(colors.pinkAccent),

    scaffoldBackgroundColor: colors.pinkLight,
    toggleableActiveColor: colors.pinkAccent, // primaryColor: const Color.fromARGB(255, 252, 242, 246),
    textTheme: TextTheme(
      headline1: GoogleFonts.raleway(fontSize: 52, fontWeight: FontWeight.w600, letterSpacing: -1.5),
      headline2: GoogleFonts.raleway(fontSize: 42, fontWeight: FontWeight.w600, letterSpacing: -0.5),
      headline3: GoogleFonts.raleway(fontSize: 49, fontWeight: FontWeight.w600),
      headline4: GoogleFonts.raleway(fontSize: 35, fontWeight: FontWeight.w600, letterSpacing: 0.25),
      headline5: GoogleFonts.raleway(fontSize: 24, fontWeight: FontWeight.w600),
      headline6: GoogleFonts.raleway(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15),
      subtitle1: GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      subtitle2: GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyText1: GoogleFonts.lato(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyText2: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      button: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      caption: GoogleFonts.lato(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      overline: GoogleFonts.lato(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
  );
}

class AppColors {
  final blueAccent = const Color(0xff4792f2);
  final blueMedium = const Color(0xff99c3f8);
  final blueLight = const Color(0xffebf3fe);
  final pinkAccent = const Color.fromARGB(255, 245, 128, 167);
  final pinkMediumPlus = const Color(0xfff6a1be);
  final pinkMedium = const Color(0xfff6a1be);
  final pinkLightPlus = const Color.fromARGB(255, 248, 209, 221);
  final pinkLightLow = const Color(0xFFFCE4EC);

  final pinkLight = Color.fromARGB(255, 250, 244, 246);

  AppColors();
}

class AppShadows {
  final normal = const BoxShadow(
    blurRadius: 4,
    color: Colors.black12,
  );

  AppShadows();
}
