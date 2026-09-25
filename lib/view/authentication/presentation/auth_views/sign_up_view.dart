import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/core/widgets/phone_number_form.dart';
import 'package:credify/core/widgets/term_or_agree.dart';
import 'package:credify/export_barrel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  final numberKey = GlobalKey<FormFieldState>();
  final numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<LoaderModel>().isLoading;
    final signMod = context.watch<SignUpViewM>();
    final readSign = context.read<SignUpViewM>();

    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacementNamed(context, Routes.onboard);
              }
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero illustration with subtle bounce
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

                      // Form Header
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get Started',
                              style: CredTextStyle.h1.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.2, end: 0),

                            const SizedBox(height: 8),

                            Text(
                              'Enter your mobile number to create your account or securely sign in.',
                              style: CredTextStyle.bs3.copyWith(
                                color: AppColors.textSecondary,
                                height: 1.4,
                              ),
                            ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.2, end: 0),

                            const SizedBox(height: 24),

                            // Phone Input Box
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showModernCountryPicker(
                                        context,
                                        signMod.availableCount,
                                        (select) {
                                          readSign.selectCode(select);
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            signMod.selected,
                                            style: CredTextStyle.h4.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          const Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            size: 20,
                                            color: AppColors.grey,
                                          ),
                                          const SizedBox(width: 8),
                                          SizedBox(
                                            height: 24,
                                            child: VerticalDivider(
                                              color: AppColors.lightGrey,
                                              thickness: 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: PhoneNumberFormField(
                                      numberCtrl: numberCtrl,
                                      numberKey: numberKey,
                                      filledColor: Colors.transparent,
                                      validator: (val) =>
                                          Validator.validateNumber(val ?? ''),
                                      onChanged: (val) {
                                        readSign.fillNumber(val);
                                        numberKey.currentState?.validate();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.15, end: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Terms & Conditions text
              const TermOfAgreeText(),

              // Action button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: signMod.filled
                    ? AppButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<LoaderModel>().changeLoadingState(() {
                              numberCtrl.text =
                                  '${signMod.selected}-${numberCtrl.text.substring(1)}';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VerifyAccView(number: numberCtrl.text),
                                ),
                              );
                            });
                          }
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

  void showModernCountryPicker(
    BuildContext context,
    List<CountryModel> lists,
    Function(String) onTap,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Select Country Code',
                      style: CredTextStyle.h3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: lists.length,
                      itemBuilder: (context, index) {
                        final item = lists[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 2,
                          ),
                          title: Text(item.name, style: CredTextStyle.bs2),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item.numberCode,
                              style: CredTextStyle.bs3.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          onTap: () {
                            onTap(item.numberCode);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
