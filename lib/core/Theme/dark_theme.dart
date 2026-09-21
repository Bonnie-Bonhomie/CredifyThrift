import 'package:credify/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'form_field_theme.dart';
import 'text_theme.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.darkBackground,
  fontFamily: 'SF-Pro',
  cardTheme: const CardThemeData(
    color: AppColors.cardDark,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  ),
  cardColor: AppColors.cardDark,
  iconTheme: const IconThemeData(
    color: AppColors.cardLight,
  ),
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    secondary: AppColors.darkPrimary,
    onSurface: Colors.white,
    surface: AppColors.cardDark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: AppColors.lightBackground,
    elevation: 0,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    headlineLarge: DarkTextTheme.headings,
    headlineMedium: DarkTextTheme.subHead,
    bodyMedium: DarkTextTheme.medium,
    bodySmall: DarkTextTheme.small,
    bodyLarge: DarkTextTheme.body,
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
      textStyle: DarkTextTheme.body.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  inputDecorationTheme: BFormTheme.darkInputTheme,
  dividerTheme: const DividerThemeData(
    color: AppColors.darkGrey,
    thickness: 1,
  ),
  listTileTheme: const ListTileThemeData(
    textColor: AppColors.cardLight,
    iconColor: AppColors.lightBlue,
    tileColor: Colors.transparent,
  ),
);