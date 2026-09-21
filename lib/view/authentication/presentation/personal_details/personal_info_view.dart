import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/core/utils/date_picker.dart';
import 'package:credify/export_barrel.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final dateOfBirth = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final firstKey = GlobalKey<FormFieldState>();
  final lastKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final readDet = context.read<DetailsViewModel>();
    final watchDet = context.watch<DetailsViewModel>();
    final loading = context.watch<LoaderModel>().isLoading;

    return LoaderWrapper(
      loading: loading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primary.withOpacity(0.08),
              ),
              child: Text(
                'Step 1 of 3',
                style: CredTextStyle.bs4.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Personal Info',
                          style: CredTextStyle.h1.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.15, end: 0),

                        const SizedBox(height: 8),

                        Text(
                          'We require your legal information to verify your account and identity.',
                          style: CredTextStyle.bs3.copyWith(
                            color: AppColors.grey,
                            height: 1.4,
                          ),
                        ).animate().fadeIn(delay: 50.ms, duration: 350.ms).slideY(begin: 0.15, end: 0),

                        const SizedBox(height: 24),

                        ReuseContainer(
                          child: FormWidget(
                            label: 'First name',
                            fieldKey: firstKey,
                            validator: (val) =>
                                Validator.validateText(val, 'first name'),
                            valController: firstNameCtrl,
                            onChanged: (val) {
                              firstKey.currentState?.validate();
                              readDet.firstFill(val);
                            },
                          ),
                        ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),

                        ReuseContainer(
                          child: FormWidget(
                            label: 'Last name',
                            fieldKey: lastKey,
                            validator: (value) =>
                                Validator.validateText(value, 'last name'),
                            valController: lastNameCtrl,
                            onChanged: (val) {
                              lastKey.currentState?.validate();
                              readDet.lastNFill(val);
                            },
                          ),
                        ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.1, end: 0),

                        ReuseContainer(
                          child: DatePicker(dateControl: dateOfBirth),
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            const Icon(
                              Icons.lock_outline_rounded,
                              size: 16,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Encrypted with 256-bit bank-grade security protocols.',
                                style: CredTextStyle.bs4.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ],
                        ).animate().fadeIn(delay: 250.ms),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: watchDet.nameFill && watchDet.lastFill
                    ? AppButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<LoaderModel>().changeLoadingState(() {
                              Navigator.pushNamed(context, Routes.address);
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
}
