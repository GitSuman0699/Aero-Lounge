import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static const Color primary = Color(0xFF0E69BF);
  static const Color secondary = Color(0xFF0A3C62);
  static const Color accent = Color(0xFF8ED6FF);

  // Scaffold background color
  static const Color scaffoldBackground = Color.fromARGB(255, 208, 203, 191);

  // Text colors
  static const Color textPrimary = Color(0xFF072E56);
  static const Color textSecondary = Color(0xFF363732);
  static const Color textWhite = Color.fromARGB(255, 235, 233, 233);
  static const Color hintText = Color(0xFFBBBBBB);

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container colors
  static const Color lightContainer = Color(0xFFEDEAE6);
  static Color darkContainer = TColors.white.withAlpha((0.1 * 255).toInt());
  static const Color containerSecondary = Color(0xFFD2D2D2);
  static const Color containerLightBlue = Color(0xFFD7F4FF);
  static const Color containerLightRed = Color(0xFFFFE7E7);
  static const Color checklistContainer = Color(0xFFE8E8E8);

  // Button colors
  static const Color buttonPrimary = Color(0xFF072E56);
  static const Color outlineButtonPrimary = Color(0xFFEDEAE6);
  static const Color buttonSecondary = Color(0xFFEDEAE6);
  static const Color buttonDisabled = Color.fromARGB(255, 172, 171, 171);
  static const Color buttonGreen = Color(0xFF34A853);
  static const Color buttonRed = Color(0xFFBD1C1C);
  static const Color logoutButtonRed = Color(0xFFA00000);

  // Border colors
  static const Color borderPrimary = Color(0xFF072E56);
  static const Color borderSecondary = Color(0xFFD2D2D2);
  static const Color borderblue = Color(0xFF00B9FF);
  static const Color borderRed = Color(0xFFFF0000);
  static const Color skipBorder = Color(0xFFE1E6EF);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color.fromARGB(255, 49, 48, 48);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);

  // Dialog colors
  static const Color dialogBackground = Color(0xFFE2E0DA);

  // Icon colors
  static const Color backIcon = Color(0xFF072E56);
  static const Color activeBottomNavigationIcon = Color(0xFFF5F5F5);

  // Radio
  static const Color radioBackgroud = Color(0xFFCBC6BF);

  // Badge
  static const Color pendingBadge = Color(0xFFCA8D00);

  static const Color dragHandleColor = Color(0xFFC4BAAB);
}
