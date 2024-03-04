import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme();
  static const Color primaryColor = Color(0xFF5939F1);
  static const Color secondaryColor = Color(0xFFFFFFFF);

  static const String primaryFontFamily = 'MyUniqueFont';
  static const TextStyle displayLarge = TextStyle(
      fontFamily: 'MyUniqueFont',
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static const TextStyle displayMedium = TextStyle(
      fontFamily: 'MyUniqueFont',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black54);

  static TextStyle copyWith(
      {String fontFamily = 'MyUniqueFont',
      double fontSize = 16,
      FontWeight fontWeight = FontWeight.w500,
      Color color = Colors.white,
      TextOverflow? overflow}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: overflow);
  }
}
