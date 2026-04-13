import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;
  final double? fontSize;
  const AppText({super.key, required this.data, this.textAlign, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: textAlign ?? TextAlign.justify, );
  }
}
