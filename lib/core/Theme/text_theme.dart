import 'package:flutter/material.dart';
import '../constants/app_color.dart';

class LightTextTheme {
  static const TextStyle headings = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF-Pro-Rounded',
    letterSpacing: -0.5,
    color: AppColors.textMain,
  );

  static const TextStyle subHead = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF-Pro-Rounded',
    letterSpacing: -0.3,
    color: AppColors.textMain,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF-Pro',
    letterSpacing: -0.2,
    color: AppColors.textMain,
  );

  static const TextStyle medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF-Pro',
    color: AppColors.textMain,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF-Pro',
    color: AppColors.grey,
  );
}

class DarkTextTheme {
  static const TextStyle headings = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF-Pro-Rounded',
    letterSpacing: -0.5,
    color: AppColors.cardLight,
  );

  static const TextStyle subHead = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'SF-Pro-Rounded',
    letterSpacing: -0.3,
    color: AppColors.cardLight,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF-Pro',
    letterSpacing: -0.2,
    color: AppColors.cardLight,
  );

  static const TextStyle medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF-Pro',
    color: AppColors.cardLight,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF-Pro',
    color: AppColors.textSecondary,
  );
}