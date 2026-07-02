import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../core/constants/app_color.dart';

class ReuseContainer extends StatelessWidget {
  final Widget child;
  final double radius;

  const ReuseContainer({super.key, required this.child, this.radius = 5.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Theme.of(context).cardTheme.color,
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
    this.autoFocus = true
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      onCompleted: onComplete,
      keyboardType: type ?? TextInputType.number,
      readOnly: readOnly,
      errorTextStyle: TextStyle(color: Colors.red, fontSize: 20),
      length: len,
      autofocus: autoFocus,
      defaultPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: AppColors.primary.withOpacity(0.2)
        ),
      ),
      submittedPinTheme: PinTheme(
        textStyle: TextStyle(fontSize: 17, color: Colors.white),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primary.withOpacity(0.2)
        ),
      ),
      focusedPinTheme: PinTheme(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.blueGrey, width: 2),
          // color: Theme.of(context).colorScheme.onSurface,
          color: AppColors.primary.withOpacity(0.2)
        ),
      ),
      showCursor: true,
      cursor: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 20, height: 2,
          color: AppColors.blueGrey,
          margin: const EdgeInsets.only(bottom: 8.0),
        ),
      )
    );
  }
}
