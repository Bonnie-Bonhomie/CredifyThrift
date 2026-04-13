
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermOfAgreeText extends StatelessWidget {
  const TermOfAgreeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By using our mobile app, you agree to our ',
        children: [
          TextSpan(
              text: 'Term of use',
              style: TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = (){}
          ),
          TextSpan(text: ' and '),
          TextSpan(
              text: 'Privacy policy.',
              style: TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = (){}
          ),
        ],
      ),
    );
  }
}
