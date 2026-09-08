import 'package:credify/core/Theme/color_theme.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:flutter/material.dart';

import 'text_theme.dart';

class BFormTheme {
  static InputDecorationTheme lightInputTheme = InputDecorationTheme(
    prefixIconColor: AppColors.darkBlue,
    suffixIconColor: AppColors.darkBlue,
    labelStyle: LightTextTheme.body.copyWith(color: AppColors.darkBlue,),
    hintStyle: LightTextTheme.body.copyWith(color: AppColors.darkBlue,),
    filled: true,
    fillColor: Colors.white,
    iconColor: AppColors.cardDark,
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
    prefixIconColor: AppColors.lightGrey,
    suffixIconColor: AppColors.lightGrey,
    labelStyle: LightTextTheme.body.copyWith(color: AppColors.textMain),
    hintStyle: LightTextTheme.body.copyWith(color: AppColors.textMain),

    iconColor: AppColors.cardLight,
    fillColor: AppColors.cardDark,
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
