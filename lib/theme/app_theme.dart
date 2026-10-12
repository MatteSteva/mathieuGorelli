import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Palette e tema centralizzati — dark mode elegante, da galleria.
class AppColors {
  static const background = Color(0xFF0D0D0D);
  static const surface = Color(0xFF151515);
  static const surfaceHover = Color(0xFF1D1D1D);
  static const border = Color(0xFF2A2A2A);
  static const textPrimary = Color(0xFFECECEC);
  static const textSecondary = Color(0xFF9B9B9B);
  static const textFaint = Color(0xFF6A6A6A);
  static const accent = Color(0xFFC2A878); // bronzo tenue, unico accento
}

class AppTheme {
  static ThemeData build() {
    final base = ThemeData.dark(useMaterial3: true);

    final textTheme = base.textTheme.copyWith(
      displayLarge: GoogleFonts.cormorantGaramond(
        fontSize: 68,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.02,
        letterSpacing: 0.5,
      ),
      displayMedium: GoogleFonts.cormorantGaramond(
        fontSize: 44,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
        height: 1.08,
      ),
      headlineMedium: GoogleFonts.cormorantGaramond(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      titleLarge: GoogleFonts.cormorantGaramond(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 17,
        height: 1.7,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 15,
        height: 1.7,
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 13,
        letterSpacing: 2.4,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 11.5,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w400,
        color: AppColors.textFaint,
      ),
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      colorScheme: base.colorScheme.copyWith(
        surface: AppColors.background,
        primary: AppColors.accent,
        secondary: AppColors.accent,
      ),
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      dividerColor: AppColors.border,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.accent,
        selectionColor: Color(0x33C2A878),
      ),
    );
  }
}
