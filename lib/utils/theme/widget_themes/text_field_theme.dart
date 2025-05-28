import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/sizes.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static TextStyle? formTextStyle =
      TTextTheme.lightTextTheme.bodyMedium?.copyWith(
    color: TColors.textPrimary,
    fontWeight: FontWeight.w500,
  );

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    contentPadding: const EdgeInsets.all(12.0),
    labelStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      color: TColors.darkGrey,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    fillColor: TColors.white,
    filled: true,
    hintStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      color: TColors.hintText,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    errorStyle: const TextStyle().copyWith(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      fontWeight: FontWeight.w600,
      color: TColors.buttonPrimary,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1.5, color: TColors.borderSecondary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.buttonPrimary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      // borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.error),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderSide: const BorderSide(width: 1.5, color: TColors.borderSecondary),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeMd,
      color: TColors.white,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TSizes.fontSizeSm,
      color: TColors.white,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.white.withAlpha((0.8 * 255).toInt()),
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TColors.warning),
    ),
  );
}
