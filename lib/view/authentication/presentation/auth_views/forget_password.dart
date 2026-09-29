import 'package:credify/export_barrel.dart';
import 'package:flutter_animate/flutter_animate.dart';

class EmailToResetPwd extends StatelessWidget {
  EmailToResetPwd({super.key});

  final emailKey = GlobalKey<FormFieldState>();
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoaderModel>().isLoading;

    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.08),
                      AppColors.primary.withOpacity(0.09),
                      AppColors.primary.withOpacity(0.01),
                    ],
                    begin: Alignment.topCenter,
                    // transform: GradientRotation(0.9),
                    end: AlignmentGeometry.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.only(left: 15, top: 40 ),
                alignment: Alignment.bottomLeft,
                child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios),)
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Center(
                      //       child: Container(
                      //         padding: const EdgeInsets.all(12),
                      //         decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: AppColors.primary.withOpacity(0.04),
                      //         ),
                      //         child: const Image(
                      //           image: AssetImage(
                      //             'assets/images/auth_image.png',
                      //           ),
                      //           height: 150,
                      //           width: 150,
                      //         ),
                      //       ),
                      //     )
                      //     .animate()
                      //     .fadeIn(duration: 400.ms)
                      //     .scale(
                      //       begin: const Offset(0.9, 0.9),
                      //       end: const Offset(1, 1),
                      //       curve: Curves.easeOutBack,
                      //     ),

                      const SizedBox(height: 20),

                      Text(
                            'Reset Password',
                            style: CredTextStyle.h1.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 100.ms)
                          .slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 8),

                      Text(
                        'Enter your email address that we can send yor reset password link to.',
                        style: CredTextStyle.bs3.copyWith(
                          color: AppColors.grey,
                          height: 1.4,
                        ),
                      ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 24),

                      // Password Field Box
                      Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Theme.of(context).cardColor,
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.15),
                                width: 1.2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: FormWidget(
                              fieldKey: emailKey,
                              textType: TextInputType.emailAddress,
                              validator: (val) {},
                              valController: emailCtrl,
                              label: 'Email',
                              onChanged: (val) {},
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 200.ms)
                          .slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 24),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        },
                        child: Text('Back to login'),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Action Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: emailCtrl.text.isNotEmpty
                    ? AppButton(
                            onPressed: () {
                              context.read<LoaderModel>().changeLoadingState(() {
                                CustomSnackbar.successSnack(
                                  context: context,
                                  message:
                                      'Reset password link has been sent to your email.',
                                );
                                // Navigator.pushNamed(context, Routes.resetPwd);
                              });
                            },
                            label: 'Continue',
                          )
                          .animate()
                          .fadeIn(duration: 200.ms)
                          .scaleXY(begin: 0.98, end: 1.0)
                    : const DisabledButton(label: 'Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final pwdKey = GlobalKey<FormFieldState>();
  final pwdCtrl = TextEditingController();
  final confirmPwdKey = GlobalKey<FormFieldState>();
  final confirmPwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final readPwd = context.read<CreatePwdVModel>();
    final watchPwd = context.watch<CreatePwdVModel>();
    final loading = context.watch<LoaderModel>().isLoading;

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
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),

                      Text(
                            'Create New Password',
                            style: CredTextStyle.h1.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 100.ms)
                          .slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 8),

                      Text(
                        'Choose a secure password that will be easy for you to remember.',
                        style: CredTextStyle.bs3.copyWith(
                          color: AppColors.grey,
                          height: 1.4,
                        ),
                      ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 24),

                      // Password Field Box
                      ReuseContainer(
                            child: FormWidget(
                              textSize: 22,
                              fieldKey: pwdKey,
                              validator: (val) {
                                readPwd.validatePwd(val ?? '');
                                return null;
                              },
                              valController: pwdCtrl,
                              obscure: watchPwd.obscure,
                              label: 'Password',
                              onChanged: (val) {
                                readPwd.filledPwd(val);
                                pwdKey.currentState?.validate();
                              },
                              suffixIcon: watchPwd.filled
                                  ? IconButton(
                                      onPressed: () => readPwd.togglePwd(),
                                      icon: Icon(
                                        watchPwd.obscure
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.primary,
                                        size: 22,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 200.ms)
                          .slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 24),

                      // Password Rules Checklist
                      Column(
                        children: [
                          _buildRuleRow(
                            'Has at least 8 characters',
                            watchPwd.minLength,
                          ),
                          const SizedBox(height: 10),
                          _buildRuleRow(
                            'Has an uppercase letter or symbol',
                            watchPwd.hasSymbol,
                          ),
                          const SizedBox(height: 10),
                          _buildRuleRow(
                            'Has at least one number',
                            watchPwd.hasNumber,
                          ),
                        ],
                      ).animate().fadeIn(delay: 250.ms),
                      const SizedBox(height: 20),

                      ReuseContainer(
                            child: FormWidget(
                              textSize: 22,
                              fieldKey: confirmPwdKey,
                              validator: (val) =>
                                  Validator.validateConfirmPassword(
                                    firstPassword: pwdCtrl.text,
                                    value: 'Confirm Password',
                                  ),
                              valController: confirmPwdCtrl,
                              obscure: watchPwd.obscure,
                              label: 'Confirm Password',
                              onChanged: (val) {
                                confirmPwdKey.currentState?.validate();
                              },
                              suffixIcon: watchPwd.filled
                                  ? IconButton(
                                      onPressed: () => readPwd.togglePwd(),
                                      icon: Icon(
                                        watchPwd.obscure
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: AppColors.primary,
                                        size: 22,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 200.ms)
                          .slideY(begin: 0.15, end: 0),
                    ],
                  ),
                ),
              ),

              // Bottom Action Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: watchPwd.isValid
                    ? AppButton(
                            onPressed: () {
                              context.read<LoaderModel>().changeLoadingState(
                                () {
                                  CustomSnackbar.successSnack(
                                    context: context,
                                    message: 'Password set successfully!',
                                  );
                                  AppDialog.showCongratDialog(
                                    context,
                                    content: Text(
                                      'Password as bean changed successfully',
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.login,
                                      );
                                    },
                                    label: 'Back to login',
                                  );
                                },
                              );
                            },
                            label: 'Reset Password',
                          )
                          .animate()
                          .fadeIn(duration: 200.ms)
                          .scaleXY(begin: 0.98, end: 1.0)
                    : const DisabledButton(label: 'Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleRow(String rule, bool valid) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: valid
            ? AppColors.complete.withOpacity(0.08)
            : AppColors.lightGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: valid
              ? AppColors.complete.withOpacity(0.3)
              : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: valid ? AppColors.complete : Colors.grey.withOpacity(0.3),
            ),
            child: Icon(
              valid ? Icons.check_rounded : Icons.circle_outlined,
              size: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              rule,
              style: CredTextStyle.bs3.copyWith(
                color: valid ? AppColors.complete : AppColors.grey,
                fontWeight: valid ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
