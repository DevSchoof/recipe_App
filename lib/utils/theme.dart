import 'package:flutter/material.dart';
class AppTheme { // Cores principais static const Color primary = Color(0xFFFF5B7F); // Rosa/Coral static const Color primaryLight = Color(0xFFFFE5EC); // Rosa bem claro static const Color primaryDark = Color(0xFFE63C63); // Rosa mais escuro static const Color accent = Color(0xFFFFA726); // Laranja para acentos static const Color background = Color(0xFFFAFAFA); // Cinza muito claro static const Color surface = Colors.white;
// Cores de texto static const Color textPrimary = Color(0xFF1F1F1F); static const Color textSecondary = Color(0xFF666666); static const Color textTertiary = Color(0xFF999999);
static ThemeData get lightTheme => ThemeData( useMaterial3: true, // Cores principais primaryColor: primary, scaffoldBackgroundColor: background, colorScheme: ColorScheme.light( primary: primary, primaryContainer: primaryLight, secondary: accent, surface: surface, error: Color(0xFFFF5B7F), ),
// AppBar
appBarTheme: AppBarTheme(
  backgroundColor: surface,
  foregroundColor: textPrimary,
  elevation: 0,
  centerTitle: true,
  titleTextStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: 0.3,
  ),
  iconTheme: IconThemeData(color: primary),
),

// Tipografia
textTheme: TextTheme(
  displayLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: -0.5,
  ),
  displayMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  ),
  titleLarge: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textSecondary,
    height: 1.5,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondary,
    height: 1.5,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textTertiary,
  ),
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
),

// Botões
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: Colors.white,
    elevation: 2,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.3,
    ),
  ),
),

outlinedButtonTheme: OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: primary,
    side: BorderSide(color: primary, width: 1.5),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
),

textButtonTheme: TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: primary,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  ),
),

// FloatingActionButton
floatingActionButtonTheme: FloatingActionButtonThemeData(
  backgroundColor: primary,
  foregroundColor: Colors.white,
  elevation: 8,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
),

// Input Decoration
inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: surface,
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: primary, width: 2),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xFFFF5B7F), width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color(0xFFFF5B7F), width: 2),
  ),
  labelStyle: TextStyle(
    color: textSecondary,
    fontWeight: FontWeight.w500,
  ),
  hintStyle: TextStyle(
    color: textTertiary,
    fontWeight: FontWeight.w400,
  ),
  errorStyle: TextStyle(
    color: Color(0xFFFF5B7F),
    fontSize: 12,
  ),
),

// Cards
cardTheme: CardTheme(
  color: surface,
  elevation: 1,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  margin: EdgeInsets.zero,
),

// Divider
dividerTheme: DividerThemeData(
  color: Color(0xFFEEEEEE),
  thickness: 1,
  space: 0,
),
); }
