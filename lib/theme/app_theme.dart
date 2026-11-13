import 'package:flutter/material.dart';

class AppTheme {
  static const Color primarySeed = Color(0xFF673AB7); // Deep Purple
  static const Color accentGreen = Color(0xFF00C853); // Savings green
  static const Color accentOrange = Color(0xFFFF9100); // Deal badge
  static const Color discountRed = Color(0xFFE53935);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primarySeed,
      brightness: Brightness.light,
      primary: primarySeed,
      secondary: const Color(0xFF7E57C2),
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF1E1E24),
      centerTitle: false,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 1.5,
      shadowColor: Colors.black.withAlpha(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF1F3F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primarySeed, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySeed,
        foregroundColor: Colors.white,
        elevation: 1,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primarySeed,
      brightness: Brightness.dark,
      primary: const Color(0xFF9575CD),
      surface: const Color(0xFF1E1E2E),
    ),
    scaffoldBackgroundColor: const Color(0xFF12121A),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF1E1E2E),
      foregroundColor: Colors.white,
      centerTitle: false,
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF1E1E2E),
      elevation: 2,
      shadowColor: Colors.black.withAlpha(80),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF272738),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF9575CD), width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF9575CD),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );
}
