import 'package:lottie/lottie.dart';

import '../../../export_barrel.dart';

class AppDialog {


  static void showCongratDialog(BuildContext context,{String subtitle = '', required Widget content, required VoidCallback onPressed, String label = 'Continue'}){
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/animations/congrat-box.json', height: 200, width: 200),
                const SizedBox(height: 20,),
                Text(
                  'Congratulations!',
                  style: CredTextStyle.h4.copyWith(color: AppColors.darkPrimary),
                ),
                const SizedBox(height: 20,),
                Text(subtitle, textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                content,
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     text: 'You`ve create your ',
                //     style: Theme.of(context).textTheme.bodyMedium,
                //     children: [
                //       TextSpan(
                //         text: ,
                //         style: CredTextStyle.h6,
                //       ),
                //       TextSpan(text: ' Saving goals '),
                //
                //     ],
                //   ),
                // ),
                const SizedBox(height: 20,),
                AppButton(onPressed: onPressed, label: label)
              ],
            ),
          ),
        );
      },
    );
  }
}