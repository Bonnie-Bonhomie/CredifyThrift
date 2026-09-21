import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../export_barrel.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardItem> _items = [
    OnboardItem(
      badge: 'HIGH-YIELD VAULTS',
      title: 'Smart Automated\nSavings Goals',
      subtitle:
          'Set custom targets, automate deposits with round-ups, and earn competitive interest effortlessly.',
      icon: Icons.savings_rounded,
      accentColor: AppColors.primary,
      statHighlight: 'Earn up to 8.5% APY',
      previewType: OnboardPreviewType.savings,
    ),
    OnboardItem(
      badge: 'WEALTH ANALYTICS',
      title: 'Effortless Real-Time\nFinancial Tracking',
      subtitle:
          'Visualize your spending, investment performance, and monthly budget with clear, actionable insights.',
      icon: Icons.auto_graph_rounded,
      accentColor: AppColors.complete,
      statHighlight: 'Track 100% of cash flow',
      previewType: OnboardPreviewType.tracking,
    ),
    OnboardItem(
      badge: 'INSTITUTIONAL GRADE',
      title: 'Bank-Grade Safety\n& Identity Protection',
      subtitle:
          'Your account is secured with 256-bit encryption, instant biometric access, and rigorous identity verification.',
      icon: Icons.shield_rounded,
      accentColor: AppColors.darkPrimary,
      statHighlight: 'Protected by 256-bit SSL',
      previewType: OnboardPreviewType.security,
    ),
  ];

  void _onNext() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(context, Routes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Logo & Skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.layers_rounded,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Credify.',
                        style: CredTextStyle.h3.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: _finishOnboarding,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: Text(
                      'Skip',
                      style: CredTextStyle.bs3.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Page View with Slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _items.length,
                onPageChanged: (idx) {
                  setState(() => _currentPage = idx);
                },
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),

                          // Visual Card Preview
                          _buildVisualPreview(item, size)
                              .animate(key: ValueKey('preview_$index'))
                              .fadeIn(duration: 400.ms, curve: Curves.easeOut)
                              .scale(
                                begin: const Offset(0.92, 0.92),
                                end: const Offset(1, 1),
                                duration: 400.ms,
                                curve: Curves.easeOutBack,
                              ),

                          const SizedBox(height: 20),

                          // Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: item.accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item.badge,
                              style: CredTextStyle.bs4.copyWith(
                                color: item.accentColor,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ).animate(key: ValueKey('badge_$index')).fadeIn().slideY(
                                begin: 0.2,
                                end: 0,
                                duration: 350.ms,
                              ),

                          const SizedBox(height: 14),

                          // Title
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: CredTextStyle.h1.copyWith(
                              fontSize: 26,
                              height: 1.2,
                              color: theme.colorScheme.onSurface,
                            ),
                          ).animate(key: ValueKey('title_$index')).fadeIn(delay: 50.ms).slideY(
                                begin: 0.15,
                                end: 0,
                                duration: 350.ms,
                              ),

                          const SizedBox(height: 10),

                          // Subtitle
                          Text(
                            item.subtitle,
                            textAlign: TextAlign.center,
                            style: CredTextStyle.bs3.copyWith(
                              color: AppColors.grey,
                              height: 1.4,
                            ),
                          ).animate(key: ValueKey('sub_$index')).fadeIn(delay: 100.ms).slideY(
                                begin: 0.15,
                                end: 0,
                                duration: 350.ms,
                              ),

                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Navigation Area (Indicators + Action Buttons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  // Animated Page Indicator Pills
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_items.length, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 28 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primary
                              : AppColors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Action Button
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _currentPage == _items.length - 1
                                ? 'Get Started'
                                : 'Continue',
                            style: CredTextStyle.h4.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Already have an account row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: CredTextStyle.bs3.copyWith(color: AppColors.grey),
                      ),
                      TextButton(
                        onPressed: _finishOnboarding,
                        child: Text(
                          'Sign In',
                          style: CredTextStyle.bs3.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualPreview(OnboardItem item, Size size) {
    return Container(
      width: size.width * 0.85,
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: item.accentColor.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: item.accentColor.withOpacity(0.12),
          width: 1.5,
        ),
      ),
      child: Stack(
        children: [
          // Background ambient gradient orb
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    item.accentColor.withOpacity(0.18),
                    item.accentColor.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),

          // Content of Card
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Icon + Highlight Tag
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: item.accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(item.icon, color: item.accentColor, size: 28),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.complete.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.complete,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Verified',
                          style: CredTextStyle.bs4.copyWith(
                            color: AppColors.complete,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Mock Graphic Details depending on type
              if (item.previewType == OnboardPreviewType.savings)
                _buildSavingsPreview(item)
              else if (item.previewType == OnboardPreviewType.tracking)
                _buildTrackingPreview(item)
              else
                _buildSecurityPreview(item),

              // Bottom Highlight Pill
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: item.accentColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.electric_bolt_rounded,
                      color: item.accentColor,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.statHighlight,
                      style: CredTextStyle.bs3.copyWith(
                        color: item.accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSavingsPreview(OnboardItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dream Home Vault', style: CredTextStyle.h4),
            Text('£18,500', style: CredTextStyle.h4.copyWith(color: item.accentColor)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: 0.74,
            minHeight: 8,
            backgroundColor: AppColors.lightGrey,
            valueColor: AlwaysStoppedAnimation<Color>(item.accentColor),
          ),
        ),
        const SizedBox(height: 4),
        Text('74% of £25,000 target achieved', style: CredTextStyle.bs4),
      ],
    );
  }

  Widget _buildTrackingPreview(OnboardItem item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _statMiniBox('Inflow', '+£4,350', AppColors.complete),
        _statMiniBox('Outflow', '-£1,820', AppColors.error),
        _statMiniBox('Invested', '£2,530', AppColors.primary),
      ],
    );
  }

  Widget _statMiniBox(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: CredTextStyle.bs4.copyWith(color: AppColors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: CredTextStyle.h5.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSecurityPreview(OnboardItem item) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.complete.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.fingerprint, color: AppColors.complete, size: 24),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Biometric Authentication', style: CredTextStyle.h5),
            Text('Face ID / Touch ID Enabled', style: CredTextStyle.bs4),
          ],
        ),
      ],
    );
  }
}

enum OnboardPreviewType { savings, tracking, security }

class OnboardItem {
  final String badge;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accentColor;
  final String statHighlight;
  final OnboardPreviewType previewType;

  OnboardItem({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.accentColor,
    required this.statHighlight,
    required this.previewType,
  });
}
