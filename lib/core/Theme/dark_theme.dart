

import 'package:credify/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'color_theme.dart';
import 'form_field_theme.dart';
import 'text_theme.dart';

final ThemeData darkTheme = ThemeData(

    // useMaterial3: 3,
    brightness: Brightness.dark,
    primaryColor: AppColors.progressColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardTheme: CardThemeData(
        color: AppColors.cardDark,
    ),
    cardColor: AppColors.cardDark,

    iconTheme: IconThemeData(
        color: AppColors.cardLight
    ),
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        secondary: AppColors.darkBlue,
        onSurface: Colors.white
    ),

    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.lightBackground,
        elevation: 0
    ),

    textTheme: TextTheme(
        headlineLarge: DarkTextTheme.headings,
        headlineMedium: DarkTextTheme.subHead,
        bodyMedium: DarkTextTheme.medium,
        bodySmall: DarkTextTheme.small,
        bodyLarge: DarkTextTheme.body
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkBlue
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkBlue,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: DarkTextTheme.body.copyWith(color: AppColors.textMain)
        )
    ),
    inputDecorationTheme: BFormTheme.darkInputTheme,
    dividerTheme: DividerThemeData(
        color: AppColors.darkGrey
    ),
    listTileTheme: ListTileThemeData(
        textColor: DarkTextTheme.body.color,
        iconColor: AppColors.cardDark,
        tileColor: Colors.transparent
    )


);