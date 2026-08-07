import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle headlineLarge(BuildContext context, {bool isDark = false}) {
    return GoogleFonts.roboto(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      letterSpacing: -0.5,
    );
  }

  static TextStyle headlineMedium(BuildContext context, {bool isDark = false}) {
    return GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: isDark ? AppColors.textPrimaryDark : AppColors.primaryGreen,
    );
  }

  static TextStyle titleLarge(BuildContext context, {bool isDark = false}) {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
    );
  }

  static TextStyle bodyMedium(BuildContext context, {bool isDark = false}) {
    return GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
      height: 1.4,
    );
  }

  static TextStyle buttonText({Color color = Colors.white}) {
    return GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle badgeText({Color color = AppColors.primaryGreen}) {
    return GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
