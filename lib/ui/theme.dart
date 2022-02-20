import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColorDark = Color.fromRGBO(237, 33, 70, 1);
const Color secondaryColor = Color.fromRGBO(252, 76, 55, 1);
const Color backgroundDark = Color.fromRGBO(18, 18, 18, 1);
const Color backgroundShapeDark = Color.fromRGBO(244, 245, 248, 1);

class ThemeStyles {
  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryColorDark,
        secondary: secondaryColor,
        background: backgroundDark,
      ),
      appBarTheme: const AppBarTheme(
        color: backgroundDark,
        centerTitle: true,
        foregroundColor: primaryColorDark,
      ),
      primaryColor: primaryColorDark,
      backgroundColor: backgroundDark,
      scaffoldBackgroundColor: backgroundDark,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: primaryColorDark,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: backgroundDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2.0,
          ),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: primaryColorDark,
      ),
    );
  }
}
