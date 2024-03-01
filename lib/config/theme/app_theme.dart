import 'package:flutter/material.dart';

const _customColor = Color.fromARGB(244, 84, 27, 207);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.orange,
  Colors.pink,
  Colors.green,
  Colors.purple
];

class Apptheme {
  final int selectedColor;

  Apptheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'no te pases de lanza compa sol oes el rango de 0 a ${_colorThemes.length - 1}');

  ThemeData theme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light);
}
