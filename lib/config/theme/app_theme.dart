import 'package:flutter/material.dart';

const MaterialColor _customColor = MaterialColor(
  0xFF6F0DE2,
  <int, Color>{
    50: Color(0xFFEDE5F4),
    100: Color(0xFFD1BBD9),
    200: Color(0xFFB28FBD),
    300: Color(0xFF9363A1),
    400: Color(0xFF7A418C),
    500: Color(0xFF6F0DE2),
    600: Color(0xFF690CCD),
    700: Color(0xFF5D0AA9),
    800: Color(0xFF510984),
    900: Color(0xFF3F0763),
  },
);

const List<Color> _colorThemes = [
  Colors.blue,
  Colors.orange,
  Colors.pink,
  Colors.green,
  _customColor,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'El valor seleccionado debe estar dentro del rango de 0 a ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: _customColor,
      scaffoldBackgroundColor: Color(0xFF121212), // Fondo oscuro
      appBarTheme: AppBarTheme(
        backgroundColor:
            Color(0xFF1F1F1F), // Color de fondo de la barra de la aplicación
      ),
    );
  }
}
