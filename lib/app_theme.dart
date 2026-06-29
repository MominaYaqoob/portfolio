import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/values/values.dart';

class AppTheme {
  static ThemeData lightThemeData = _buildTheme(Brightness.light);
  static ThemeData darkThemeData = _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.darkBackground,
      secondary: AppColors.accentViolet,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: isDark ? AppColors.darkSurface : AppColors.white,
      onSurface: isDark ? AppColors.white : AppColors.secondaryColor,
      background: isDark ? AppColors.darkBackground : AppColors.accentColor,
      onBackground: isDark ? AppColors.white : AppColors.secondaryColor,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
      dividerColor: isDark ? AppColors.darkBorder : AppColors.grey100,
      highlightColor: Colors.transparent,
      splashColor: AppColors.primaryColor.withOpacity(0.12),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: CardThemeData(
        elevation: isDark ? 0 : 2,
        color: isDark ? AppColors.darkCard : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
          side: isDark
              ? BorderSide(color: AppColors.darkBorder.withOpacity(0.6))
              : BorderSide.none,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.darkBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
        ),
      ),
      textTheme: _textTheme(isDark),
    );
  }

  static TextTheme _textTheme(bool isDark) {
    const bold = FontWeight.w700;
    const semiBold = FontWeight.w600;
    const regular = FontWeight.w400;

    final primaryText = isDark ? AppColors.white : AppColors.secondaryColor;
    final bodyText = isDark ? AppColors.grey150 : AppColors.primaryText2;
    final mutedText = isDark ? AppColors.grey250 : AppColors.primaryText1;

    return TextTheme(
      displayLarge: GoogleFonts.spaceGrotesk(
        fontSize: Sizes.TEXT_SIZE_96,
        color: primaryText,
        fontWeight: bold,
      ),
      displayMedium: GoogleFonts.spaceGrotesk(
        fontSize: Sizes.TEXT_SIZE_60,
        color: primaryText,
        fontWeight: bold,
      ),
      displaySmall: GoogleFonts.spaceGrotesk(
        fontSize: Sizes.TEXT_SIZE_48,
        color: primaryText,
        fontWeight: bold,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        fontSize: Sizes.TEXT_SIZE_34,
        color: primaryText,
        fontWeight: bold,
      ),
      headlineSmall: GoogleFonts.spaceGrotesk(
        fontSize: Sizes.TEXT_SIZE_24,
        color: primaryText,
        fontWeight: bold,
      ),
      titleLarge: GoogleFonts.spaceGrotesk(
        fontSize: Sizes.TEXT_SIZE_20,
        color: primaryText,
        fontWeight: semiBold,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: Sizes.TEXT_SIZE_18,
        color: primaryText,
        fontWeight: semiBold,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: Sizes.TEXT_SIZE_14,
        color: primaryText,
        fontWeight: semiBold,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: Sizes.TEXT_SIZE_16,
        color: bodyText,
        fontWeight: regular,
        height: 1.7,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: Sizes.TEXT_SIZE_14,
        color: bodyText,
        fontWeight: regular,
        height: 1.6,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: Sizes.TEXT_SIZE_16,
        color: primaryText,
        fontWeight: semiBold,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: Sizes.TEXT_SIZE_12,
        color: mutedText,
        fontWeight: regular,
      ),
    ).apply(
      bodyColor: bodyText,
      displayColor: primaryText,
    );
  }
}
