
import 'package:credify/export_barrel.dart';
import 'package:flutter/gestures.dart';

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

    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(leading: IconButton(icon: Icon(Icons.keyboard_arrow_left_sharp), onPressed: () => Navigator.pop(context),), backgroundColor: Colors.transparent,),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image(image: AssetImage('assets/images/auth_image.png'), height: 200, width: 200,)),

              const SizedBox(height:  20,),
              Text('Confirm', style: Theme.of(context).textTheme.headlineLarge),
              Text('Please enter the 6-digit code just sent to ${widget.number}'),
              const SizedBox(height: 20),
              SizedBox(
                height: 55,
                width: 300,
                child: CustomPinPut(
                  controller: pinTextCtrl,
                  len: 4,
                  readOnly: loading,
                  height: 60,
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
              const Spacer(),
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
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
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
              const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}






