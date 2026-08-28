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



class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child, this.height = 270, this.bottomMargin = 30, this.allPadding = 15});

  final Widget child;
  final double height;
  final double bottomMargin;
  final double allPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(bottom: bottomMargin),
      padding: EdgeInsets.all(allPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.gradientBtn],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}

