import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      focusColor: colors.pinkMedium,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      fillColor: colors.pinkLightLow,
    ),

    dividerColor: Colors.black26,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: RecipeAppTheme.colors.pinkLight,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      centerTitle: true,
      backgroundColor: colors.pinkBackground,
      scrolledUnderElevation: 12,
      shadowColor: colors.pinkLightLow,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: colors.pinkAccent),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: colors.pinkBackground),
    canvasColor: colors.pinkBackground,
    listTileTheme: ListTileThemeData(
      visualDensity: const VisualDensity(vertical: -3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colors.pinkLightLow,
      selectedColor: colors.pinkAccent,
      elevation: 0,
      pressElevation: 0,
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: colors.pinkAccent,
      textTheme: ButtonTextTheme.primary,
    ),
    primaryColor: Colors.white,
    iconTheme: IconThemeData(
      color: colors.pinkAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        surfaceTintColor: colors.pinkAccent,
      ),
    ),
    textButtonTheme: const TextButtonThemeData(),
    // primarySwatch: Palette.pToLight,
    primarySwatch: createMaterialColor(colors.pinkAccent),

    scaffoldBackgroundColor: colors.pinkBackground, // primaryColor: const Color.fromARGB(255, 252, 242, 246),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.barlowCondensed(fontSize: 52, fontWeight: FontWeight.w600, letterSpacing: -1.5),
      displayMedium: GoogleFonts.barlowCondensed(fontSize: 42, fontWeight: FontWeight.w600, letterSpacing: -0.5),
      displaySmall: GoogleFonts.barlowCondensed(fontSize: 49, fontWeight: FontWeight.w600),
      headlineMedium: GoogleFonts.barlowCondensed(fontSize: 35, fontWeight: FontWeight.w600, letterSpacing: 0.25),
      headlineSmall: GoogleFonts.barlowCondensed(fontSize: 24, fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.barlowCondensed(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.25),
      titleMedium: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      titleSmall: GoogleFonts.barlowCondensed(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.25),
      bodyLarge: GoogleFonts.montserrat(fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.pinkAccent;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.pinkAccent;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.pinkAccent;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return colors.pinkAccent;
        }
        return null;
      }),
    ),
  );
}

class AppColors {
  final blueAccent = const Color(0xff4792f2);
  final blueMedium = const Color(0xff99c3f8);
  final blueLight = const Color(0xffebf3fe);
  final pinkAccent = const Color.fromARGB(255, 245, 128, 167);
  final pinkMediumPlus = const Color.fromARGB(255, 253, 185, 207);
  final pinkMedium = const Color(0xfff6a1be);
  final pinkLightPlus = const Color.fromARGB(255, 255, 229, 237);
  final pinkLightLow = const Color(0xFFFCE4EC);

  final pinkLight = const Color.fromARGB(255, 250, 244, 246);
  final pinkLines = const Color.fromARGB(255, 245, 198, 214);
  final pinkBackground = const Color.fromARGB(255, 255, 251, 252);

  AppColors();
}

class AppShadows {
  final normal = const BoxShadow(
    blurRadius: 5,
    color: Colors.black12,
  );

  AppShadows();
}
