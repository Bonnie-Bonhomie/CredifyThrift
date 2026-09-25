import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/export_barrel.dart';
import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:credify/viewModel/app_model.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final AppModel appModel = AppModel();
  bool _hideBalance = false;

  final List<QuickActionItem> _quickActions = [
    QuickActionItem('Top up', Icons.add_circle_outline_rounded, AppColors.primary),
    QuickActionItem('Transfer', Icons.send_rounded, AppColors.complete),
    QuickActionItem('Activity', Icons.receipt_long_rounded, AppColors.middle),
    QuickActionItem('Savings', Icons.savings_outlined, AppColors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Hero Banner with Balance & Quick Actions
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildHeroHeader(context),

                // Floating Quick Actions Bar
                Positioned(
                  bottom: -28,
                  left: 20,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(_quickActions.length, (index) {
                        final action = _quickActions[index];
                        return _buildQuickActionButton(action);
                      }),
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                ),
              ],
            ),

            const SizedBox(height: 48),

            // Upcoming Investments Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Upcoming', style: CredTextStyle.h3),
                          const SizedBox(height: 2),
                          Text(
                            'Your next automated investments',
                            style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: CredTextStyle.bs4.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        return _buildUpcomingCard(index);
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // My Savings Section (From Provider)
            Consumer<SavingNotifier>(
              builder: (context, s, child) {
                final save = s.savings;
                if (save.isEmpty) {
                  return const SizedBox.shrink();
                }
                int len = save.length >= 3 ? 3 : save.length;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My Savings', style: CredTextStyle.h3),
                              const SizedBox(height: 2),
                              Text(
                                'Active savings goals',
                                style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.availableSaving);
                            },
                            child: Text(
                              'See all',
                              style: CredTextStyle.bs4.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 200,
                        child: ListView.separated(
                          itemCount: len,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) => const SizedBox(width: 14),
                          itemBuilder: (context, index) {
                            final saving = save[index];
                            return SavingBox(appModel: appModel, saving: saving);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 16),

            // Recent Transactions / This Month Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Recent Activity', style: CredTextStyle.h3),
                          const SizedBox(height: 2),
                          Text(
                            'Your latest transactions',
                            style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildTransactionRow(
                          icon: Icons.coffee_rounded,
                          iconColor: AppColors.middle,
                          title: 'Artisan Coffee Roasters',
                          category: 'Food & Dining',
                          amount: '-£4.50',
                          date: 'Today, 2:40 PM',
                          isNegative: true,
                        ),
                        const Divider(height: 20),
                        _buildTransactionRow(
                          icon: Icons.arrow_downward_rounded,
                          iconColor: AppColors.complete,
                          title: 'Salary Deposit',
                          category: 'Income • Tech Corp',
                          amount: '+£3,450.00',
                          date: 'Yesterday',
                          isNegative: false,
                        ),
                        const Divider(height: 20),
                        _buildTransactionRow(
                          icon: Icons.shopping_bag_outlined,
                          iconColor: AppColors.primary,
                          title: 'Apple Store UK',
                          category: 'Gadgets & Tech',
                          amount: '-£129.00',
                          date: '20 Sep',
                          isNegative: true,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'View All Transactions',
                                  style: CredTextStyle.bs3.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.chevron_right_rounded,
                                  size: 18,
                                  color: AppColors.primary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroHeader(BuildContext context) {
    return Container(
      height: 310,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 40),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Brand & Profile Row
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.layers_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Credify.',
                style: CredTextStyle.h2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              // Notification button
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Balance Header
          Row(
            children: [
              Text(
                'Total Available Balance',
                style: CredTextStyle.bs4.copyWith(
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() => _hideBalance = !_hideBalance);
                },
                child: Icon(
                  _hideBalance
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Big Currency Amount
          Text(
            _hideBalance ? '••••••••' : appModel.formatCurrency(128450),
            style: CredTextStyle.h1.copyWith(
              fontSize: 34,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.05, end: 0),

          const SizedBox(height: 4),

          Text(
            'Updated just now • Tier 1 Verified',
            style: CredTextStyle.bs4.copyWith(
              color: Colors.white.withOpacity(0.65),
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(QuickActionItem item) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                item.icon,
                size: 22,
                color: item.color,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              item.title,
              style: CredTextStyle.bs4.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingCard(int index) {
    final titles = ['S&P 500 Index', 'Real Estate Vault', 'Crypto Staking'];
    final yields = ['+11.4% p.a.', '+9.2% p.a.', '+7.8% p.a.'];
    final amounts = ['£250/mo', '£150/mo', '£100/mo'];
    final icons = [
      Icons.trending_up_rounded,
      Icons.domain_rounded,
      Icons.currency_bitcoin_rounded,
    ];

    return Container(
      width: 170,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icons[index], color: AppColors.primary, size: 18),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.complete.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  yields[index],
                  style: CredTextStyle.bs4.copyWith(
                    color: AppColors.complete,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titles[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CredTextStyle.h5.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 2),
              Text(
                amounts[index],
                style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    ).animate(delay: (index * 80).ms).fadeIn().slideX(begin: 0.1, end: 0);
  }

  Widget _buildTransactionRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String category,
    required String amount,
    required String date,
    required bool isNegative,
  }) {
    return Row(
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CredTextStyle.h5.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                category,
                style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: CredTextStyle.h5.copyWith(
                fontWeight: FontWeight.w700,
                color: isNegative ? AppColors.error : AppColors.complete,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              date,
              style: CredTextStyle.bs4.copyWith(
                color: AppColors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class QuickActionItem {
  final String title;
  final IconData icon;
  final Color color;

  QuickActionItem(this.title, this.icon, this.color);
}
