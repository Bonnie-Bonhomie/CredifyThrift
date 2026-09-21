import 'package:camera/camera.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/Helpers/cred_textstyle.dart';
import 'package:credify/core/widgets/app_button.dart';
import 'package:credify/core/widgets/dialogs/app_custom_dialog.dart';
import 'package:flutter/material.dart';

class VerifyMethod extends StatefulWidget {
  const VerifyMethod({super.key});

  @override
  State<VerifyMethod> createState() => _VerifyMethodState();
}

class _VerifyMethodState extends State<VerifyMethod> {
  String imgPath = '';
  String photoPath = '';
  bool submitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Identity Verification',
          style: CredTextStyle.h3,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              Text(
                'Verify your identity to unlock full deposit and withdrawal capabilities.',
                textAlign: TextAlign.center,
                style: CredTextStyle.bs3.copyWith(
                  color: AppColors.grey,
                  height: 1.4,
                ),
              ).animate().fadeIn(duration: 350.ms),

              const SizedBox(height: 20),

              _buildIdCard(
                context,
                icon: Icons.badge_outlined,
                title: 'Government-Issued ID',
                subtitle:
                    'Driver\'s license, National ID card, or Passport photo page.',
                isDone: imgPath.isNotEmpty,
                onPressed: () => _showIDSheet(context),
              ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 16),

              _buildIdCard(
                context,
                icon: Icons.face_rounded,
                title: 'Live Selfie Check',
                subtitle:
                    'Quick facial verification to match your photo with your ID document.',
                isDone: photoPath.isNotEmpty,
                onPressed: () async {
                  final response = await Navigator.pushNamed(
                    context,
                    Routes.camera,
                  );
                  if (response is XFile) {
                    setState(() {
                      photoPath = response.path;
                    });
                  }
                },
              ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 32),

              imgPath.isEmpty && photoPath.isEmpty
                  ? const DisabledButton(label: 'Submit for Verification')
                  : submitting
                      ? const DisabledButton(label: 'Submitting...')
                      : AppButton(
                          onPressed: () {
                            setState(() => submitting = true);
                            AppDialog.showCongratDialog(
                              context,
                              subtitle:
                                  'Thanks! We will review your documents within 10 minutes.',
                              content: Text(
                                'Get ready to experience seamless modern finance with Credify.',
                                textAlign: TextAlign.center,
                                style: CredTextStyle.bs3.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.mainS,
                                );
                              },
                            );
                          },
                          label: 'Submit for Verification',
                        ).animate().fadeIn().scaleXY(begin: 0.98, end: 1.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isDone,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDone
              ? AppColors.complete.withOpacity(0.4)
              : AppColors.primary.withOpacity(0.12),
          width: 1.5,
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
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isDone
                      ? AppColors.complete.withOpacity(0.1)
                      : AppColors.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isDone ? Icons.check_circle_rounded : icon,
                  color: isDone ? AppColors.complete : AppColors.primary,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: CredTextStyle.h4),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: CredTextStyle.bs4.copyWith(
                        color: AppColors.grey,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(
                isDone ? Icons.check_rounded : Icons.camera_alt_outlined,
                size: 18,
                color: isDone ? AppColors.complete : AppColors.primary,
              ),
              label: Text(
                isDone ? 'Photo Attached (Tap to change)' : 'Take Photo',
                style: CredTextStyle.bs3.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDone ? AppColors.complete : AppColors.primary,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isDone
                      ? AppColors.complete.withOpacity(0.4)
                      : AppColors.primary.withOpacity(0.2),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showIDSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Document Type', style: CredTextStyle.h3),
            const SizedBox(height: 6),
            Text(
              'Choose an official government ID for authentication.',
              style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 20),
            _sheetTile(context, 'Passport', recommend: true),
            const Divider(height: 1),
            _sheetTile(context, 'Driver\'s License'),
            const Divider(height: 1),
            _sheetTile(context, 'National Identity Card'),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sheetTile(BuildContext context, String type, {bool recommend = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.credit_card_rounded,
          color: AppColors.primary,
          size: 20,
        ),
      ),
      title: Row(
        children: [
          Text(type, style: CredTextStyle.bs2.copyWith(fontWeight: FontWeight.w500)),
          if (recommend) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.complete.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Recommended',
                style: CredTextStyle.bs4.copyWith(
                  color: AppColors.complete,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ],
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.grey,
      ),
      onTap: () async {
        Navigator.pop(context);
        final response = await Navigator.pushNamed(context, Routes.camera);
        if (response is XFile) {
          setState(() {
            imgPath = response.path;
          });
        }
      },
    );
  }
}
