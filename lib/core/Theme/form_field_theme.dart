import 'package:credify/core/Theme/color_theme.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:flutter/material.dart';

import 'text_theme.dart';

class BFormTheme {
  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    prefixIconColor: ColorTheme.darkPrimary,
    suffixIconColor: ColorTheme.darkPrimary,
    labelStyle: LightTextTheme.body.copyWith(color: ColorTheme.darkPrimary),
    hintStyle: LightTextTheme.body.copyWith(color: ColorTheme.darkPrimary),
    filled: true,
    fillColor: AppColors.lightGrey,
    iconColor: ColorTheme.containerDark,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide.none
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static InputDecorationTheme darkInputTheme = InputDecorationTheme(
    prefixIconColor: ColorTheme.lightPrimary,
    suffixIconColor: ColorTheme.lightPrimary,
    labelStyle: LightTextTheme.body.copyWith(color: ColorTheme.textLight),
    hintStyle: LightTextTheme.body.copyWith(color: ColorTheme.textLight),

    iconColor: ColorTheme.containerLight,
    fillColor: AppColors.darkGrey,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(15.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
