import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/config/AppRoutes/routes.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/Helpers/cred_textstyle.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Profile', style: CredTextStyle.h3),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // User Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.primary.withOpacity(0.08)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.gradientBtn],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'BB',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bonnie Bonhomie', style: CredTextStyle.h3),
                          const SizedBox(height: 3),
                          Text(
                            '+234 903 784 8903',
                            style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.complete.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.verified_rounded,
                                  size: 14,
                                  color: AppColors.complete,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Tier 1 Verified',
                                  style: CredTextStyle.bs4.copyWith(
                                    color: AppColors.complete,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              // Menu Sections
              Text('Security & Settings', style: CredTextStyle.h3),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primary.withOpacity(0.08)),
                ),
                child: Column(
                  children: [
                    _menuTile(
                      icon: Icons.person_outline_rounded,
                      title: 'Personal Information',
                      subtitle: 'Legal name, contact & residential details',
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56),
                    _menuTile(
                      icon: Icons.lock_outline_rounded,
                      title: 'Security & Biometrics',
                      subtitle: 'Passcode, Face ID, Two-factor authentication',
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56),
                    _menuTile(
                      icon: Icons.credit_card_rounded,
                      title: 'Payment Methods & Cards',
                      subtitle: 'Linked bank accounts and cards',
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56),
                    _menuTile(
                      icon: Icons.notifications_none_rounded,
                      title: 'Notifications & Alerts',
                      subtitle: 'Push notifications, statement alerts',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Text('Support & Documents', style: CredTextStyle.h3),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primary.withOpacity(0.08)),
                ),
                child: Column(
                  children: [
                    _menuTile(
                      icon: Icons.headset_mic_outlined,
                      title: '24/7 Help & Support',
                      subtitle: 'Live chat and assistance',
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56),
                    _menuTile(
                      icon: Icons.description_outlined,
                      title: 'Terms of Service',
                      subtitle: 'Credify user agreements & disclosures',
                      onTap: () {},
                    ),
                    const Divider(height: 1, indent: 56),
                    _menuTile(
                      icon: Icons.privacy_tip_outlined,
                      title: 'Privacy Policy',
                      subtitle: 'How your financial data is protected',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.onboard,
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout_rounded, color: AppColors.error, size: 20),
                  label: Text(
                    'Log Out',
                    style: CredTextStyle.bs3.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.error.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.primary, size: 20),
      ),
      title: Text(title, style: CredTextStyle.h5.copyWith(fontSize: 14)),
      subtitle: Text(
        subtitle,
        style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
      ),
      trailing: const Icon(
        Icons.chevron_right_rounded,
        color: AppColors.grey,
        size: 20,
      ),
    );
  }
}
