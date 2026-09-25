import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/Helpers/cred_textstyle.dart';

class InvestPageView extends StatelessWidget {
  const InvestPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investments', style: CredTextStyle.h3),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.history_rounded),
            tooltip: 'Order History',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Portfolio Card
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.darkGradient,
                      AppColors.gradientBtn,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.35),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Portfolio Value',
                          style: CredTextStyle.bs4.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.complete.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_upward_rounded,
                                size: 12,
                                color: AppColors.complete,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                '+14.6% All-time',
                                style: CredTextStyle.bs4.copyWith(
                                  color: AppColors.complete,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '£24,850.40',
                      style: CredTextStyle.h1.copyWith(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ).animate().fadeIn().slideX(begin: -0.05, end: 0),
                    const SizedBox(height: 4),
                    Text(
                      '+£3,150.20 unrealized gains',
                      style: CredTextStyle.bs4.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 350.ms).slideY(begin: 0.1, end: 0),

              const SizedBox(height: 24),

              // Asset Allocation Section
              Text('Asset Breakdown', style: CredTextStyle.h3),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.primary.withOpacity(0.08)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Segmented color bar
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Row(
                        children: [
                          Expanded(flex: 55, child: Container(height: 10, color: AppColors.primary)),
                          const SizedBox(width: 2),
                          Expanded(flex: 25, child: Container(height: 10, color: AppColors.complete)),
                          const SizedBox(width: 2),
                          Expanded(flex: 20, child: Container(height: 10, color: AppColors.middle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAllocationBadge('Global Equities', '55%', AppColors.primary),
                        _buildAllocationBadge('Real Estate', '25%', AppColors.complete),
                        _buildAllocationBadge('Gov Bonds', '20%', AppColors.middle),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Featured Funds
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Curated Portfolios', style: CredTextStyle.h3),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Explore',
                      style: CredTextStyle.bs4.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              _buildFundCard(
                title: 'Clean Energy & Climate Innovation',
                category: 'ESG Equity • Moderate Risk',
                apy: '+16.2% 1Y',
                icon: Icons.eco_rounded,
                iconColor: AppColors.complete,
              ),
              const SizedBox(height: 10),
              _buildFundCard(
                title: 'Global Tech Titans ETF',
                category: 'Index Tracker • High Growth',
                apy: '+22.4% 1Y',
                icon: Icons.memory_rounded,
                iconColor: AppColors.primary,
              ),
              const SizedBox(height: 10),
              _buildFundCard(
                title: 'High-Yield Property Trust',
                category: 'Commercial Real Estate • Balanced',
                apy: '+8.9% 1Y',
                icon: Icons.apartment_rounded,
                iconColor: AppColors.middle,
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllocationBadge(String label, String pct, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            ),
            const SizedBox(width: 6),
            Text(pct, style: CredTextStyle.h5.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
        const SizedBox(height: 2),
        Text(label, style: CredTextStyle.bs4.copyWith(color: AppColors.grey, fontSize: 11)),
      ],
    );
  }

  Widget _buildFundCard({
    required String title,
    required String category,
    required String apy,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardLight,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CredTextStyle.h5.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  category,
                  style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.complete.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              apy,
              style: CredTextStyle.bs4.copyWith(
                color: AppColors.complete,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
