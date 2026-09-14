
import 'package:flutter/material.dart';
import '../constants/app_color.dart';


class LightTextTheme{

  static const TextStyle headings = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
      fontFamily: '.SF Pro Display',
      color: AppColors.textMain
  );
  static const TextStyle subHead = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: '.SF Pro Display',
      color: AppColors.textMain
  );
  static const TextStyle body = TextStyle(
      fontSize: 17,
      fontFamily: '.SF Pro Text',
     color: AppColors.textMain
  );

  static const TextStyle small = TextStyle(
      fontSize: 13,
      fontFamily: '.SF Pro Text',
      color: AppColors.textMain
  );
  static const TextStyle medium = TextStyle(
      fontSize: 15,
      fontFamily: '.SF Pro Text',
      color: AppColors.textMain
  );


}

class DarkTextTheme{

  static const TextStyle headings = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      fontFamily: '.SF Pro Display',
      color: AppColors.cardLight
  );
  static const TextStyle subHead = TextStyle(
      fontSize: 20,
      fontFamily: '.SF Pro Display',
      fontWeight: FontWeight.bold,

      color: AppColors.cardLight
  );
  static const TextStyle body = TextStyle(
      fontSize: 17,
      fontFamily: '.SF Pro Text',
      color: AppColors.cardLight
  );

  static const TextStyle small = TextStyle(
      fontSize: 13,
      fontFamily: '.SF Pro Text',
      color: AppColors.cardLight
  );
  static const TextStyle medium = TextStyle(
      fontSize: 15,
      fontFamily: '.SF Pro Text',
      color: AppColors.cardLight
  );

}