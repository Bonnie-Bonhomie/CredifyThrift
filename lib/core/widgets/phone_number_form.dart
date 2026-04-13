import 'package:credify/core/utils/phone_number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberFormField extends StatelessWidget {

  final TextEditingController numberCtrl;
  final GlobalKey<FormFieldState> numberKey;
  final FormFieldValidator<String?> validator;
  final Function(String)? onChanged;
  final Color? filledColor;

  const PhoneNumberFormField({super.key, required this.numberCtrl,
    required this.numberKey, required this.validator, this.filledColor = Colors.white, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberCtrl,
      key: numberKey,
      autofocus: false,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PhoneNumberFormatter(),
        // FilteringTextInputFormatter.allow(r'^(^(?:[+0]9)?[0-9 ]{})')
      ],
      validator: validator ,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: '080X XXX XXXX',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        filled: true,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        //   borderSide: BorderSide.none,
        // ),
      ),
    );
  }
}


