import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/custom_snack_bar.dart';
import 'package:credify/core/utils/form_widget.dart';
import 'package:credify/core/utils/loaderFile/loading_wrapper.dart';
import 'package:credify/core/utils/Helpers/cred_textstyle.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/viewModel/auth_view_model/create_pwd_v_model.dart';
import 'package:credify/viewModel/loader_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePasswordView extends StatelessWidget {
  CreatePasswordView({super.key});

  final pwdKey = GlobalKey<FormFieldState>();
  final pwdCtrl = TextEditingController();

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
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            height: 150,
                            width: 150,
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1), curve: Curves.easeOutBack),

                      const SizedBox(height: 20),

                      Text(
                        'Create Password',
                        style: CredTextStyle.h1.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.15, end: 0),

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
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.15, end: 0),

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
                    ],
                  ),
                ),
              ),

              // Bottom Action Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: watchPwd.isValid
                    ? AppButton(
                        onPressed: () {
                          context.read<LoaderModel>().changeLoadingState(() {
                            CustomSnackbar.successSnack(
                              context: context,
                              message: 'Password set successfully!',
                            );
                            Navigator.pushNamed(context, Routes.personalInfo);
                          });
                        },
                        label: 'Continue',
                      ).animate().fadeIn(duration: 200.ms).scaleXY(begin: 0.98, end: 1.0)
                    : const DisabledButton(label: 'Continue'),
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
