import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de Colores
  static const Color _primaryColor = Color(
    0xFF3498DB,
  ); // Un azul moderno y accesible
  static const Color _backgroundColor = Color(
    0xFF121212,
  ); // Fondo oscuro estándar de Material Design
  static const Color _surfaceColor = Color(
    0xFF1E1E1E,
  ); // Para tarjetas y superficies elevadas
  static const Color _errorColor = Color(
    0xFFCF6679,
  ); // Rojo de error de Material para temas oscuros

  static const Color _onBackgroundColor = Color(0xFFE0E0E0); // Texto principal
  static const Color _onSurfaceColor = Color(
    0xFFBDBDBD,
  ); // Texto secundario o de menor énfasis

  // Tema Oscuro
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _backgroundColor,

      // Esquema de colores principal
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: _primaryColor,
        onPrimary: Colors.white,
        secondary:
            _primaryColor, // Puedes definir un color secundario si lo necesitas
        onSecondary: Colors.white,
        error: _errorColor,
        onError: Colors.black,
        surface: _surfaceColor,
        onSurface: _onSurfaceColor,
      ),

      // Tipografía con Google Fonts (Poppins)
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: _onBackgroundColor, displayColor: _onBackgroundColor),

      // Estilo para Inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _surfaceColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: _primaryColor, width: 2.0),
        ),
        labelStyle: const TextStyle(color: _onSurfaceColor),
        hintStyle: const TextStyle(color: _onSurfaceColor),
      ),

      // Estilo para Botones Elevados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),

      // Estilo para Tarjetas
      cardTheme: CardThemeData(
        color: _surfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),

      // Estilo para la AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: _backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
