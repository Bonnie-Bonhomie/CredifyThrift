import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../core/constants/app_color.dart';

class ReuseContainer extends StatelessWidget {
  final Widget child;
  final double radius;

  const ReuseContainer({super.key, required this.child, this.radius = 16.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: AppColors.primary.withOpacity(0.12),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CustomPinPut extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onComplete;
  final int len;
  final bool readOnly;
  final double height;
  final TextInputType? type;
  final bool autoFocus;

  const CustomPinPut({
    super.key,
    required this.controller,
    required this.onComplete,
    required this.len,
    required this.readOnly,
    required this.height,
    this.type,
    this.autoFocus = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultTheme = PinTheme(
      width: 58,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      textStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'SF-Pro-Rounded',
        color: isDark ? Colors.white : AppColors.textMain,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isDark
            ? AppColors.cardDark
            : AppColors.primary.withOpacity(0.05),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : AppColors.primary.withOpacity(0.12),
          width: 1.5,
        ),
      ),
    );

    final focusedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.primary, width: 2),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );

    final submittedTheme = defaultTheme.copyWith(
      decoration: defaultTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.complete, width: 1.5),
        color: isDark
            ? AppColors.cardDark
            : AppColors.complete.withOpacity(0.06),
      ),
    );

    return Pinput(
      controller: controller,
      onCompleted: onComplete,
      keyboardType: type ?? TextInputType.number,
      readOnly: readOnly,
      length: len,
      autofocus: autoFocus,
      defaultPinTheme: defaultTheme,
      focusedPinTheme: focusedTheme,
      submittedPinTheme: submittedTheme,
      showCursor: true,
      cursor: Align(
        alignment: Alignment.center,
        child: Container(
          width: 2,
          height: 24,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final bool accent;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    this.accent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF-Pro-Rounded',
            ),
          ),
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  final Widget child;
  const ListCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightGrey),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
