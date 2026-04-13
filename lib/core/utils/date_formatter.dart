

import 'package:flutter/services.dart';

class DateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // TODO: implement formatEditUpdate
    //TO REMOVE SPACE

    String digitOnly = newValue.text.replaceAll(' ', '');
    if (digitOnly.length > 8) {
      digitOnly = digitOnly.substring(0, 8);
    }
    String formatted = '';
    if (digitOnly.isNotEmpty) {

      formatted = digitOnly.substring(
        0,
        (digitOnly.length >= 2) ? 2 : digitOnly.length,
      );
    }
    if (digitOnly.length > 2) {
      formatted += '/${digitOnly.substring(2, ((digitOnly.length >= 4) ? 4 : digitOnly.length))}';
    }
    if (digitOnly.length > 4) {
      formatted += '/${digitOnly.substring(4)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
