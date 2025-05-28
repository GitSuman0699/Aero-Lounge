import 'package:aero_lounge/utils/constants/colors.dart';
import 'package:aero_lounge/utils/constants/sizes.dart';
import 'package:aero_lounge/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.dark,
    // ),
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: TColors.lightContainer,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.black, size: TSizes.iconMd),
    titleTextStyle: TTextTheme.lightTextTheme.titleLarge?.copyWith(
      color: TColors.black,
      fontSize: 18,
      fontWeight: FontWeight.w900,
    ),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: TColors.light, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: TColors.light, size: TSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: TColors.white),
  );
}
