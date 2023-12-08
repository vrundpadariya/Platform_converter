import 'package:flutter/material.dart';

class apptheme {
  static ThemeData Light = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color(0XFF36eb97),
  );

  static ThemeData Dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: Colors.purpleAccent,
  );
}
