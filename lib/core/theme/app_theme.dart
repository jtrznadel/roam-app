import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roam/gen/colors.gen.dart';

class AppTheme {
  const AppTheme._();

  static final _appTheme = ThemeData(brightness: Brightness.light);

  static final _textTheme = GoogleFonts.interTextTheme(_appTheme.textTheme)
      .copyWith(
        displayMedium: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: AppColors.fontPrimary,
        ),
        headlineLarge: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.fontPrimary,
        ),
        headlineMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.fontPrimary,
        ),
        headlineSmall: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.fontPrimary,
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.fontPrimary,
        ),
        labelMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.fontPrimary,
        ),
        labelSmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.fontPrimary,
        ),
        bodyLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.fontPrimary,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.fontPrimary,
        ),
        bodySmall: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.fontPrimary,
        ),
      );

  static ThemeData get defaultTheme => _appTheme.copyWith(
    colorScheme: _appTheme.colorScheme.copyWith(
      primary: AppColors.primary,
      secondary: AppColors.primary,
      error: AppColors.primary,
    ),
    textTheme: _textTheme,
    scaffoldBackgroundColor: AppColors.background,
    navigationBarTheme: _appTheme.navigationBarTheme.copyWith(
      backgroundColor: AppColors.background,
      indicatorColor: AppColors.primary,
      labelTextStyle: WidgetStatePropertyAll(
        _textTheme.labelMedium!.copyWith(color: AppColors.fontPrimary),
      ),
      iconTheme: WidgetStatePropertyAll(
        const IconThemeData(color: AppColors.fontPrimary),
      ),
    ),
  );
}
