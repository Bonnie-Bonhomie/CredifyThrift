import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/view/savings/notifier/saving_notifier.dart';
import 'package:credify/viewModel/app_model.dart';
import '../../../export_barrel.dart';

class SavingPage extends StatefulWidget {
  const SavingPage({super.key});

  @override
  State<SavingPage> createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  final AppModel appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Gradient Header
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        'Savings Goals',
                        style: CredTextStyle.h3.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_rounded, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Total Amount Saved',
                    style: CredTextStyle.bs4.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    appModel.formatCurrency(14850),
                    style: CredTextStyle.h1.copyWith(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ).animate().fadeIn().slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 4),
                  Text(
                    'Earning 5.2% Annual Yield • Compounded Daily',
                    style: CredTextStyle.bs4.copyWith(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 44,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.availableSaving);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      icon: const Icon(Icons.add_rounded, size: 20),
                      label: Text(
                        'Create New Goal',
                        style: CredTextStyle.h5.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Savings List / Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Consumer<SavingNotifier>(
                builder: (context, savingNotifier, child) {
                  final savings = savingNotifier.savings;

                  if (savings.isEmpty) {
                    return _buildEmptyState(context);
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Active Vaults', style: CredTextStyle.h3),
                          Text(
                            '${savings.length} active',
                            style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(savings.length, (index) {
                        final s = savings[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: SavingCard(appModel: appModel, saving: s),
                        ).animate(delay: (index * 60).ms).fadeIn().slideY(begin: 0.1, end: 0);
                      }),
                    ],
                  );
                },
              ),
            ),

            // Smart Round-ups Tip Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.12),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Smart Spare Change Active',
                            style: CredTextStyle.h5.copyWith(fontSize: 14),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Every purchase is rounded up to the nearest £1 and saved automatically.',
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
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.08)),
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
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.savings_rounded,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text('No Savings Goals Yet', style: CredTextStyle.h3),
          const SizedBox(height: 8),
          Text(
            'Create your first savings vault to start putting aside funds with automated recurring deposits.',
            textAlign: TextAlign.center,
            style: CredTextStyle.bs3.copyWith(
              color: AppColors.grey,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            height: 44,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.availableSaving);
              },
              child: const Text('Start a Goal'),
            ),
          ),
        ],
      ),
    );
  }
}
