// app_styles.dart
import 'package:flutter/material.dart';
import 'package:golden_doctor/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Default font settings
  // static String fontFamily = 'Lobster';
  static String fontFamily = 'Raleway';
  static double headline1Size = 28.0;
  static double headline2Size = 16.0;
  static double headline3Size = 14.0;
  static double body1Size = 24.0;
  static double body2Size = 14.0;
  static double body3Size = 12.0;

  static FontWeight headline1Weight = FontWeight.w600;
  static FontWeight headline2Weight = FontWeight.w600;
  static FontWeight headline3Weight = FontWeight.w600;
  static FontWeight body1Weight = FontWeight.w500;
  static FontWeight body2Weight = FontWeight.w500;
  static FontWeight body3Weight = FontWeight.w400;

  // TextStyles
  static TextStyle get headline1 => GoogleFonts.getFont(
        fontFamily,
        fontSize: headline1Size,
        fontWeight: headline1Weight,
        color: AppColors.black1C,
      );

  static TextStyle get headline2 => GoogleFonts.getFont(
        fontFamily,
        fontSize: headline2Size,
        fontWeight: headline2Weight,
        color: AppColors.black1C,
      );

  static TextStyle get headline3 => GoogleFonts.getFont(
        fontFamily,
        fontSize: headline3Size,
        fontWeight: headline3Weight,
        color: AppColors.black1C,
      );

  static TextStyle get body1 => GoogleFonts.getFont(
        fontFamily,
        fontSize: body1Size,
        fontWeight: body1Weight,
        color: AppColors.black1C,
      );

  static TextStyle get body2 => GoogleFonts.getFont(
        fontFamily,
        fontSize: body2Size,
        fontWeight: body2Weight,
        color: AppColors.black1C,
      );

  static TextStyle get body3 => GoogleFonts.getFont(
        fontFamily,
        fontSize: body3Size,
        fontWeight: body3Weight,
        color: AppColors.grey70,
      );

  // Update method to set font values from Firebase data
  static void updateFontStyles({
    required String family,
  }) {
    fontFamily = family;
  }
}
