import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/constants/app_size.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/widgets/custom_pin_code_field.dart';
import 'package:credify/viewModel/auth_view_model/sign_in_v_model.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyAccView extends StatefulWidget {
  final String number;

  const VerifyAccView({super.key, required this.number});

  @override
  State<VerifyAccView> createState() => _VerifyAccViewState();
}

class _VerifyAccViewState extends State<VerifyAccView> {
  final TextEditingController pinTextCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    context.read<SignUpViewM>().startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final otpModel = context.watch<SignUpViewM>();
    final loading = context.watch<LoaderModel>().isLoading;
    final readOtp = context.read<SignUpViewM>();

    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.keyboard_arrow_left_sharp), backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSize.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            Text('Confirm', style: Theme.of(context).textTheme.headlineLarge),
            Text('Please enter the 6-digit code just sent to ${widget.number}'),
            const SizedBox(height: 20),
            SizedBox(
              height: 55,
              width: 200,
              child: CustomPinCodeField(
                pinTextCtrl: pinTextCtrl,
                len: 4,
                readOnly: loading,
                height: 50,
                onComplete: (pin) {
                  if(pin.length == 4){
                    context.read<LoaderModel>().changeLoadingState((){
                      readOtp.onComplete(context, pin);
                      readOtp.cancelTimer();
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 200),
            loading
                ? Text('verifying....')
                :  otpModel.inCorrectCode || otpModel.seconds == 0
                ? RichText(
              text: TextSpan(
                text: 'Incorrect code, try again ',
                style: TextStyle(color: Colors.red),
                children: [
                  TextSpan(
                    text: 'Resend',
                    style: TextStyle(color: AppColors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        readOtp.resetTimer();
                        readOtp.startTimer();
                      },
                  ),
                ],
              ),
            ): Consumer<SignUpViewM>(
                    builder: (context, timeReader, child) {
                      return Text('Resend code in 00:${timeReader.seconds}');
                    },
                  ),
            // SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}






