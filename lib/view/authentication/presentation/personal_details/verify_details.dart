import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/export_barrel.dart';

class VerifyDetailsView extends StatelessWidget {
  const VerifyDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Step 3 of 3',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Almost There!',
                        style: CredTextStyle.h1.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 8),

                      Text(
                        'Please verify that all the information provided below is accurate before proceeding.',
                        style: CredTextStyle.bs3.copyWith(
                          color: AppColors.grey,
                          height: 1.4,
                        ),
                      ).animate().fadeIn(delay: 50.ms, duration: 350.ms).slideY(begin: 0.15, end: 0),

                      const SizedBox(height: 24),

                      // Review Container Card
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _reviewTile(
                              context,
                              icon: Icons.person_outline_rounded,
                              title: 'Full Legal Name',
                              value: 'Bonnie Bonhomie',
                            ),
                            const Divider(height: 20),
                            _reviewTile(
                              context,
                              icon: Icons.phone_android_rounded,
                              title: 'Phone Number',
                              value: '+234 903 784 8903',
                            ),
                            const Divider(height: 20),
                            _reviewTile(
                              context,
                              icon: Icons.cake_outlined,
                              title: 'Date of Birth',
                              value: '20 Oct 2002',
                            ),
                            const Divider(height: 20),
                            _reviewTile(
                              context,
                              icon: Icons.location_on_outlined,
                              title: 'Residential Address',
                              value: '14 Kensington Square, London, UK',
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 100.ms).scaleXY(begin: 0.96, end: 1.0),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: AppButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.verifyID);
                  },
                  label: 'Confirm & Continue',
                ).animate().fadeIn(duration: 200.ms).scaleXY(begin: 0.98, end: 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: CredTextStyle.h5.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Edit',
              style: CredTextStyle.bs4.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
