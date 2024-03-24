import 'package:flutter/material.dart';

const kFontFamily = 'Rubik';

final themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF8F8F8)),
  primaryColor: AppColors.primaryColor,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.textFieldTextColor,
    selectionColor: AppColors.textFieldTextColor,
    selectionHandleColor: AppColors.textFieldTextColor,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.headingColor,
      fontSize: 34,
      fontFamily: kFontFamily,
      letterSpacing: -0.68,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: AppColors.textFieldTextColor,
      fontSize: 12,
      fontFamily: kFontFamily,
      letterSpacing: 0.12,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: AppColors.headingColor,
      fontSize: 15,
      fontFamily: kFontFamily,
      fontWeight: FontWeight.w400,
      height: 0.09,
    ),
  ),
);

class AppColors {
  /// app colors
  static const primaryColor = Color(0xFFF8F8F8);
  static const buttonColor = Color(0xFFFF678B);

  /// text colors
  static const headingColor = Color(0xFF242424);
  static const bodyTextColor = Color(0xFF222222);

  /// card colors
  static const cardTextColorBlack = Color(0xFF000000);
  static const cardBackgroundColor = Color(0xFFF8F8F8);

  // icons colors
  static const ratingIconColor = Color(0xFFFFD875);
  static const selectedIconColor = Color(0xFFEB5757);
  static const unselectedIconColor = Color(0xFF414141);

  // text field colors
  static const textFieldIconColor = Color(0xFFB9B9B9);
  static const textFieldTextColor = Color(0xFFA3A3A3);
}
