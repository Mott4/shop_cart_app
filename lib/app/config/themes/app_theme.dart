import 'package:flutter/material.dart';

class AppThemes {
  static ApplicationColors colors = ApplicationColors();
  static ApplicationButtonStyles buttonStyle = ApplicationButtonStyles();
  static ApplicationTextStyles textStyles = ApplicationTextStyles();
}

class ApplicationColors {
  // Temas Principais
  Color appBarTheme = const Color.fromARGB(255, 0, 150, 136);
}

class ApplicationButtonStyles {}

class ApplicationTextStyles {
  TextStyle cartSearchHintText = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  TextStyle cartSearch = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
}
