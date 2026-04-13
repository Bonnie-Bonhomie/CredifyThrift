import 'package:credify/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class GradientPageWidget extends StatelessWidget {
  const GradientPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.primary,
            AppColors.darkBlue
          ], begin: Alignment.topLeft, end: Alignment.centerRight)
        ),
      ),
    );
  }
}
