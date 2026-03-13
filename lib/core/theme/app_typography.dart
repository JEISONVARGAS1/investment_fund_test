import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Tipografía central con [TextStyle] reutilizables.
/// Familia base: Source Code Pro.
class AppTypography {
  AppTypography._();

  static TextStyle _base({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.sourceCodePro(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: AppColors.textPrimary,
    );
  }

  // Headings
  static TextStyle get h1 => _base(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle get h2 => _base(fontSize: 28, fontWeight: FontWeight.bold);
  static TextStyle get h3 => _base(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle get h4 => _base(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle get h5 => _base(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle get h6 => _base(fontSize: 16, fontWeight: FontWeight.w600);

  // Body
  static TextStyle get bodyLarge =>
      _base(fontSize: 16).copyWith(color: AppColors.textPrimary);
  static TextStyle get bodyMedium =>
      _base(fontSize: 14).copyWith(color: AppColors.textPrimary);
  static TextStyle get bodySmall =>
      _base(fontSize: 12).copyWith(color: AppColors.textPrimary);

  // Button
  static TextStyle get button =>
      _base(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle get buttonSecondary =>
      _base(fontSize: 14, fontWeight: FontWeight.w500);

  // Utility
  static TextStyle get caption =>
      _base(fontSize: 12).copyWith(color: AppColors.textSecondary);
  static TextStyle get label =>
      _base(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle get link => _base(fontSize: 14, fontWeight: FontWeight.w500)
      .copyWith(color: AppColors.info, decoration: TextDecoration.underline);
}
