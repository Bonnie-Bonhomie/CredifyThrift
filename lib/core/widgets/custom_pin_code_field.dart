
import 'package:credify/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class CustomPinCodeField extends StatelessWidget {
  final TextEditingController pinTextCtrl;
  final Function(String)? onComplete;
  final int len;
  final double height;
  final double textSize;
  final bool readOnly;
  final bool showCursor;
  final bool obscure;

  const CustomPinCodeField({
    super.key,
    required this.pinTextCtrl,
    required this.len,
    this.onComplete,
    this.height = 50,
    this.textSize = 20,
    this.readOnly = false,
    this.showCursor = true,
    this.obscure = false
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: pinTextCtrl,
      keyboardType: TextInputType.number,
      length: len,
      readOnly: readOnly,
      showCursor: showCursor,
      obscureText: obscure,
      textStyle: TextStyle(fontSize: textSize),
      onCompleted: onComplete,
      mainAxisAlignment: MainAxisAlignment.center,
      backgroundColor: Theme.of(context).cardTheme.color,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9]{0,4}'))
      ],
      separatorBuilder: (context, index){
        return Container(height: 55, width: 4, color: Theme.of(context).scaffoldBackgroundColor,);
      },
      cursorColor: AppColors.blueGrey,
      pinTheme: PinTheme(
        borderRadius: BorderRadius.circular(5.0),
        shape: PinCodeFieldShape.box,
        fieldOuterPadding: EdgeInsets.all(3),
        inactiveFillColor: Colors.yellow,
        fieldHeight: height,
        fieldWidth: 40,

        // activeColor: AppColors.primary,
        activeFillColor: Colors.yellow,
        selectedFillColor: Colors.blueGrey,
        selectedColor: AppColors.blueGrey,
        activeColor: Colors.transparent,
          inactiveColor: Colors.transparent
      ),
    );
  }
}
