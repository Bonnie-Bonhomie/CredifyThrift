

import 'package:flutter/material.dart';
import 'color_theme.dart';
import 'form_field_theme.dart';
import 'text_theme.dart';

final ThemeData darkTheme = ThemeData(

    // useMaterial3: 3,
    brightness: Brightness.dark,
    primaryColor: ColorTheme.containerLight,
    scaffoldBackgroundColor: ColorTheme.backgroundDark,
    cardTheme: CardThemeData(
        color: ColorTheme.containerDark,
    ),

    iconTheme: IconThemeData(
        color: ColorTheme.containerLight
    ),
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        primary: ColorTheme.lightPrimary,
        secondary: ColorTheme.darkPrimary,
        onSurface: Colors.white
    ),

    appBarTheme: AppBarTheme(
        backgroundColor: ColorTheme.backgroundDark,
        foregroundColor: ColorTheme.backgroundLight,
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
        backgroundColor: ColorTheme.darkPrimary
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.darkPrimary,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: DarkTextTheme.body.copyWith(color: ColorTheme.textLight)
        )
    ),
    inputDecorationTheme: BFormTheme.darkInputTheme,
    dividerTheme: DividerThemeData(
        color: ColorTheme.containerLight
    ),
    listTileTheme: ListTileThemeData(
        textColor: DarkTextTheme.body.color,
        iconColor: ColorTheme.containerLight,
        tileColor: Colors.transparent
    )


);