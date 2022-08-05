import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeAppTheme {
  ThemeData themeData = ThemeData(
    splashFactory: NoSplash.splashFactory,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        decorationColor: Colors.pink.shade600,
      ),
      filled: true,
      fillColor: Palette.pToLight.shade700,
      // contentPadding: EdgeInsets.only(left: 4),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Palette.pToLight.shade800,
      scrolledUnderElevation: 3,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: Palette.pToLight.shade50),
    ),

    canvasColor: const Color.fromARGB(255, 252, 242, 246),
    listTileTheme: ListTileThemeData(
      visualDensity: const VisualDensity(vertical: -3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Palette.pToLight.shade700,
      selectedColor: Palette.pToLight.shade500,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.pink,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(
      color: Palette.pToLight.shade100,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        // surfaceTintColor: Colors.pink.shade400,
      ),
    ),

    primarySwatch: Palette.pToLight,
    scaffoldBackgroundColor: const Color.fromARGB(255, 252, 242, 246),
    toggleableActiveColor: Colors.pink.shade300, // primaryColor: const Color.fromARGB(255, 252, 242, 246),
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

//palette.dart
class Palette {
  static const MaterialColor pToLight = MaterialColor(
    0xfff06292, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfff2729d), //10%
      100: Color(0xfff381a8), //20%
      200: Color(0xfff591b3), //30%
      300: Color(0xfff6a1be), //40%
      400: Color(0xfff6a1be), //50%
      500: Color(0xfff9c0d3), //60%
      600: Color(0xfffbd0de), //70%
      700: Color(0xfffce0e9), //80%
      800: Color(0xfffeeff4), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
