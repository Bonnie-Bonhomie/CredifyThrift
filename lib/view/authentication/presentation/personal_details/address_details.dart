import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/export_barrel.dart';

class AddressDetailsView extends StatelessWidget {
  AddressDetailsView({super.key});

  final streetCtrl = TextEditingController();
  final apartment = TextEditingController();
  final zipCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final stateCtrl = TextEditingController();

  final streetKey = GlobalKey<FormFieldState>();
  final aptKey = GlobalKey<FormFieldState>();
  final zipKey = GlobalKey<FormFieldState>();
  final cityKey = GlobalKey<FormFieldState>();
  final stateKey = GlobalKey<FormFieldState>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final readDet = context.read<DetailsViewModel>();
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
                'Step 2 of 3',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home Address',
                          style: CredTextStyle.h1.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.15, end: 0),

                        const SizedBox(height: 8),

                        Text(
                          'Provide your residential address for card dispatch and regulatory checks.',
                          style: CredTextStyle.bs3.copyWith(
                            color: AppColors.grey,
                            height: 1.4,
                          ),
                        ).animate().fadeIn(delay: 50.ms, duration: 350.ms).slideY(begin: 0.15, end: 0),

                        const SizedBox(height: 20),

                        ReuseContainer(
                          child: FormWidget(
                            label: 'Street Address',
                            fieldKey: streetKey,
                            validator: (val) =>
                                Validator.validateText(val, 'street address'),
                            valController: streetCtrl,
                            onChanged: (val) {
                              streetKey.currentState?.validate();
                              readDet.firstFill(val);
                            },
                          ),
                        ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),

                        ReuseContainer(
                          child: FormWidget(
                            label: 'Apartment / Suite (Optional)',
                            fieldKey: aptKey,
                            validator: (value) => null,
                            valController: apartment,
                            onChanged: (val) {
                              aptKey.currentState?.validate();
                              readDet.lastNFill(val);
                            },
                          ),
                        ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.1, end: 0),

                        Row(
                          children: [
                            Expanded(
                              child: ReuseContainer(
                                child: FormWidget(
                                  label: 'City',
                                  fieldKey: cityKey,
                                  validator: (value) =>
                                      Validator.validateText(value, 'city'),
                                  valController: cityCtrl,
                                  onChanged: (val) {
                                    cityKey.currentState?.validate();
                                    readDet.lastNFill(val);
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ReuseContainer(
                                child: FormWidget(
                                  label: 'State',
                                  fieldKey: stateKey,
                                  validator: (value) =>
                                      Validator.validateText(value, 'state'),
                                  valController: stateCtrl,
                                  onChanged: (val) {
                                    stateKey.currentState?.validate();
                                    readDet.lastNFill(val);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),

                        ReuseContainer(
                          child: FormWidget(
                            label: 'Zip / Postal Code',
                            fieldKey: zipKey,
                            validator: (value) =>
                                Validator.validateText(value, 'zip code'),
                            valController: zipCodeCtrl,
                            onChanged: (val) {
                              zipKey.currentState?.validate();
                              readDet.lastNFill(val);
                            },
                          ),
                        ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.1, end: 0),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.verifyDet);
                  },
                  label: 'Continue',
                ).animate().fadeIn(duration: 200.ms).scaleXY(begin: 0.98, end: 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
