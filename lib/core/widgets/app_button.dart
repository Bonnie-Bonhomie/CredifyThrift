import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool loading;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(colors: [
          AppColors.primary,
          // AppColors.primary,
          AppColors.gradientBtn,

        ], begin: Alignment.topCenter, end: Alignment.bottomRight, )
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            Text( label, style: TextStyle(color: AppColors.lightBackground),),
            loading
                ? SizedBox(
              width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: AppColors.lightGrey),
                  )
                : SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class DisabledButton extends StatelessWidget {
  final String label;
  const DisabledButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.disableColor
      ), child: Text(label, style: TextStyle(color: Colors.grey.withOpacity(0.8)),),),
    );
  }
}

