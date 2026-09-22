import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/Helpers/cred_textstyle.dart';

class ActivityPageView extends StatefulWidget {
  const ActivityPageView({super.key});

  @override
  State<ActivityPageView> createState() => _ActivityPageViewState();
}

class _ActivityPageViewState extends State<ActivityPageView> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Inflow', 'Outflow', 'Savings'];

  final List<ActivityItem> _activities = [
    ActivityItem(
      title: 'Salary Deposit',
      subtitle: 'Bank Transfer • Tech Solutions Ltd',
      amount: '+£3,450.00',
      date: 'Today, 09:30 AM',
      icon: Icons.south_west_rounded,
      color: AppColors.complete,
      isInflow: true,
    ),
    ActivityItem(
      title: 'Whole Foods Market',
      subtitle: 'Groceries • Contactless Card',
      amount: '-£42.80',
      date: 'Today, 01:15 PM',
      icon: Icons.shopping_basket_rounded,
      color: AppColors.middle,
      isInflow: false,
    ),
    ActivityItem(
      title: 'Uber UK Trip',
      subtitle: 'Transportation • Visa Debit',
      amount: '-£14.20',
      date: 'Yesterday, 10:45 PM',
      icon: Icons.local_taxi_rounded,
      color: AppColors.primary,
      isInflow: false,
    ),
    ActivityItem(
      title: 'Auto-Save Round Up',
      subtitle: 'Vault: Emergency Fund',
      amount: '+£0.80',
      date: 'Yesterday, 10:45 PM',
      icon: Icons.savings_rounded,
      color: AppColors.lightBlue,
      isInflow: true,
    ),
    ActivityItem(
      title: 'Netflix Subscription',
      subtitle: 'Recurring • Direct Debit',
      amount: '-£10.99',
      date: '19 Sep 2026',
      icon: Icons.movie_outlined,
      color: AppColors.error,
      isInflow: false,
    ),
    ActivityItem(
      title: 'Dividends Payout',
      subtitle: 'Vanguard Global All Cap',
      amount: '+£84.50',
      date: '18 Sep 2026',
      icon: Icons.trending_up_rounded,
      color: AppColors.complete,
      isInflow: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredList = _activities.where((item) {
      if (_selectedFilter == 1) return item.isInflow;
      if (_selectedFilter == 2) return !item.isInflow;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Activity', style: CredTextStyle.h3),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download_rounded),
            tooltip: 'Export Statement',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_rounded),
            tooltip: 'Filter',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filter Pills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final selected = _selectedFilter == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedFilter = index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.primary
                              : Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selected
                                ? AppColors.primary
                                : AppColors.lightGrey,
                          ),
                        ),
                        child: Text(
                          _filters[index],
                          style: CredTextStyle.bs4.copyWith(
                            color: selected ? Colors.white : AppColors.grey,
                            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Monthly Summary Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSummaryItem('Total Inflow', '+£3,535.30', AppColors.complete),
                    Container(height: 36, width: 1, color: AppColors.lightGrey),
                    _buildSummaryItem('Total Outflow', '-£68.79', AppColors.error),
                  ],
                ),
              ).animate().fadeIn().slideY(begin: 0.1, end: 0),
            ),

            const SizedBox(height: 16),

            // Activity List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: filteredList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = filteredList[index];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.05),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: item.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(item.icon, color: item.color, size: 22),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: CredTextStyle.h5.copyWith(fontSize: 15),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                item.subtitle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item.amount,
                              style: CredTextStyle.h5.copyWith(
                                color: item.isInflow
                                    ? AppColors.complete
                                    : AppColors.error,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              item.date,
                              style: CredTextStyle.bs4.copyWith(
                                color: AppColors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ).animate(delay: (index * 50).ms).fadeIn().slideX(begin: 0.05, end: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: CredTextStyle.bs4.copyWith(color: AppColors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: CredTextStyle.h4.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class ActivityItem {
  final String title;
  final String subtitle;
  final String amount;
  final String date;
  final IconData icon;
  final Color color;
  final bool isInflow;

  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
    required this.icon,
    required this.color,
    required this.isInflow,
  });
}
