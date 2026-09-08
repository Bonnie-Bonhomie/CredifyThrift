
import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import 'color_theme.dart';


class LightTextTheme{

  static const TextStyle headings = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
      color: AppColors.textMain
  );
  static const TextStyle subHead = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textMain
  );
  static const TextStyle body = TextStyle(
      fontSize: 17,
     color: AppColors.textMain
  );

  static const TextStyle small = TextStyle(
      fontSize: 13,
      color: AppColors.textMain
  );
  static const TextStyle medium = TextStyle(
      fontSize: 15,
      color: AppColors.textMain
  );


}

class DarkTextTheme{

  static const TextStyle headings = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: AppColors.cardLight
  );
  static const TextStyle subHead = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.cardLight
  );
  static const TextStyle body = TextStyle(
      fontSize: 17,
      color: AppColors.cardLight
  );

  static const TextStyle small = TextStyle(
      fontSize: 13,
      color: AppColors.cardLight
  );
  static const TextStyle medium = TextStyle(
      fontSize: 15,
      color: AppColors.cardLight
  );

}