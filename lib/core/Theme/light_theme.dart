import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import 'form_field_theme.dart';
import 'text_theme.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.lightBackground,
  fontFamily: 'SF-Pro',
  cardTheme: const CardThemeData(
    color: AppColors.cardLight,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  ),
  cardColor: AppColors.cardLight,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: AppColors.primary,
    secondary: AppColors.darkPrimary,
    onSurface: AppColors.surface,
    surface: AppColors.cardLight,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.cardDark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.textMain,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    headlineLarge: LightTextTheme.headings,
    headlineMedium: LightTextTheme.subHead,
    bodyMedium: LightTextTheme.medium,
    bodySmall: LightTextTheme.small,
    bodyLarge: LightTextTheme.body,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      textStyle: LightTextTheme.body.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  inputDecorationTheme: BFormTheme.lightInputTheme,
  dividerTheme: const DividerThemeData(
    color: AppColors.lightGrey,
    thickness: 1,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: AppColors.textMain,
    iconColor: AppColors.primary,
    tileColor: Colors.transparent,
  ),
);