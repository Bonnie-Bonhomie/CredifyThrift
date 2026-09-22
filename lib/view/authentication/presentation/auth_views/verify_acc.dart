import 'package:flutter/gestures.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/export_barrel.dart';

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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SignUpViewM>().startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final otpModel = context.watch<SignUpViewM>();
    final loading = context.watch<LoaderModel>().isLoading;
    final readOtp = context.read<SignUpViewM>();

    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary.withOpacity(0.04),
                    ),
                    child: const Image(
                      image: AssetImage('assets/images/auth_image.png'),
                      height: 160,
                      width: 160,
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1), curve: Curves.easeOutBack),

                const SizedBox(height: 24),

                Text(
                  'Verify Number',
                  style: CredTextStyle.h1.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.15, end: 0),

                const SizedBox(height: 8),

                Text(
                  'Please enter the 4-digit code sent to ${widget.number}',
                  style: CredTextStyle.bs3.copyWith(
                    color: AppColors.grey,
                    height: 1.4,
                  ),
                ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.15, end: 0),

                const SizedBox(height: 32),

                // PIN input container
                Center(
                  child: SizedBox(
                    height: 65,
                    child: CustomPinPut(
                      controller: pinTextCtrl,
                      len: 4,
                      readOnly: loading,
                      height: 60,
                      onComplete: (pin) {
                        if (pin.length == 4) {
                          context.read<LoaderModel>().changeLoadingState(() {
                            readOtp.onComplete(context, pin);
                            readOtp.cancelTimer();
                          });
                        }
                      },
                    ),
                  ),
                ).animate().fadeIn(delay: 200.ms).scaleXY(begin: 0.95, end: 1.0),

                const Spacer(),

                // Resend / timer section
                Center(
                  child: loading
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Verifying code...',
                              style: CredTextStyle.bs3.copyWith(color: AppColors.primary),
                            ),
                          ],
                        )
                      : otpModel.inCorrectCode || otpModel.seconds == 0
                          ? RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: otpModel.inCorrectCode
                                    ? 'Incorrect code. '
                                    : 'Didn\'t receive code? ',
                                style: CredTextStyle.bs3.copyWith(
                                  color: otpModel.inCorrectCode
                                      ? AppColors.error
                                      : AppColors.grey,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Resend Code',
                                    style: CredTextStyle.bs3.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        readOtp.resetTimer();
                                        readOtp.startTimer();
                                      },
                                  ),
                                ],
                              ),
                            )
                          : Consumer<SignUpViewM>(
                              builder: (context, timeReader, child) {
                                final secStr = timeReader.seconds < 10
                                    ? '0${timeReader.seconds}'
                                    : '${timeReader.seconds}';
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.timer_outlined,
                                        size: 16,
                                        color: AppColors.primary,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Resend code in 00:$secStr',
                                        style: CredTextStyle.bs3.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                ).animate().fadeIn(delay: 250.ms),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
