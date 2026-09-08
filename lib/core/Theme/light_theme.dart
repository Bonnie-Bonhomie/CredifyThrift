
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import 'color_theme.dart';
import 'form_field_theme.dart';
import 'text_theme.dart';

final ThemeData lightTheme = ThemeData(

  brightness: Brightness.light,
  primaryColor: AppColors.progressColor,
  scaffoldBackgroundColor: AppColors.lightBackground,
  cardTheme: CardThemeData(
    color: AppColors.cardLight
  ),
cardColor: AppColors.cardLight,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primary,
    secondary: AppColors.darkBlue,
    onSurface: AppColors.surface,
    surface: AppColors.onSurface
  ),

  iconTheme: IconThemeData(
    color: AppColors.cardDark
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.primary,
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
    backgroundColor: AppColors.primary
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      textStyle: LightTextTheme.body.copyWith(color: AppColors.textMain)
    )
  ),
  inputDecorationTheme: BFormTheme.lightInputTheme,
  dividerTheme: DividerThemeData(
    color: AppColors.cardDark
  ),

    listTileTheme: ListTileThemeData(
        textColor: LightTextTheme.body.color,
        iconColor: AppColors.darkBlue,
        tileColor: Colors.transparent
    ),

  // dividerColor: AppColors.progressColor
);