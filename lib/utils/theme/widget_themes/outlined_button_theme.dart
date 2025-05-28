import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      backgroundColor: TColors.softGrey,
      foregroundColor: TColors.secondary,
      side: const BorderSide(color: TColors.textPrimary, width: 1.8),
      textStyle: TTextTheme.lightTextTheme.titleMedium!.copyWith(
        color: TColors.textPrimary,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.5,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: TSizes.buttonHeight),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: TColors.light,
      side: const BorderSide(color: TColors.borderPrimary),
      textStyle: TextStyle(
        fontSize: 16,
        color: TColors.primary,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      ),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.buttonRadius),
      ),
    ),
  );
}
