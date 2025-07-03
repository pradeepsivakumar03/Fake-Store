import 'package:fake_store/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // static ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   primarySwatch: Colors.blue,
  //   scaffoldBackgroundColor: Colors.white,
  //   textTheme: GoogleFonts.poppinsTextTheme().copyWith(
  //     bodyLarge: const TextStyle(fontSize: 16),
  //   ),
  // );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppPalettes.primaryColor,
    scaffoldBackgroundColor: AppPalettes.scaffoldBG,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPalettes.backgroundColor,
      foregroundColor: AppPalettes.foregroundColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1E1E2F),
      secondary: Color(0xFF5DD39E),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.dark().textTheme,
    ).copyWith(
      bodyLarge: const TextStyle(color: Color(0xFFE0E0E0)),
    ),
  );
}
