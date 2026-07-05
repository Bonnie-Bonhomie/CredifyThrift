
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import 'color_theme.dart';
import 'form_field_theme.dart';
import 'text_theme.dart';

final ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,
  primaryColor: ColorTheme.containerDark,
  scaffoldBackgroundColor: ColorTheme.backgroundLight,
  cardTheme: CardThemeData(
    color: ColorTheme.containerLight
  ),
cardColor: ColorTheme.containerLight,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: ColorTheme.lightPrimary,
    secondary: ColorTheme.darkPrimary,
    onSurface: AppColors.surface,
    surface: AppColors.onSurface
  ),

  iconTheme: IconThemeData(
    color: ColorTheme.containerDark
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: ColorTheme.lightPrimary,
    foregroundColor: ColorTheme.lightPrimary,
    elevation: 0
  ),

  textTheme: TextTheme(
    headlineLarge: LightTextTheme.headings,
    headlineMedium: LightTextTheme.subHead,
    bodyMedium: LightTextTheme.medium,
    bodySmall: LightTextTheme.small,
    bodyLarge: LightTextTheme.body
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorTheme.lightPrimary
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorTheme.lightPrimary,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      textStyle: LightTextTheme.body.copyWith(color: ColorTheme.textLight)
    )
  ),
  inputDecorationTheme: BFormTheme.lightInputTheme,
  dividerTheme: DividerThemeData(
    color: ColorTheme.containerDark
  ),

    listTileTheme: ListTileThemeData(
        textColor: LightTextTheme.body.color,
        iconColor: ColorTheme.darkPrimary,
        tileColor: Colors.transparent
    ),
);