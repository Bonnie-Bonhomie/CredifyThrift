import 'package:flutter/material.dart';

class CustomSnackbar {
  static void successSnack({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height- 100, right: 16, left: 16),
      ),
    );
  }

  static void errorSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height- 100, right: 16, left: 16),
      ),
    );
  }

  static void warningSnack(BuildContext context, String message) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(fontWeight: FontWeight.bold)),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height- 100, right: 16, left: 16),
        backgroundColor: Colors.orange,
        dismissDirection: DismissDirection.startToEnd,

      ),

    );
  }
}
