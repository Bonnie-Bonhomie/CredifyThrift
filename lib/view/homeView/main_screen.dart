import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:credify/core/constants/app_color.dart';
import 'package:credify/core/utils/Helpers/cred_textstyle.dart';
import 'package:credify/view/view_export.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = const [
    HomePageView(),
    ActivityPageView(),
    SavingPage(),
    InvestPageView(),
    ProfilePageView(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      floatingActionButton: _buildPrimaryFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: BottomAppBar(
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            height: 64,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(Icons.home_rounded, 'Home', 0),
                _navItem(Icons.swap_horiz_rounded, 'Activity', 1),
                // Center spacer for FAB
                const SizedBox(width: 48),
                _navItem(Icons.trending_up_rounded, 'Invest', 3),
                _navItem(Icons.person_rounded, 'Profile', 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String title, int index) {
    final bool selected = currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: selected
                    ? AppColors.primary.withOpacity(0.12)
                    : Colors.transparent,
              ),
              child: Icon(
                icon,
                size: 22,
                color: selected
                    ? AppColors.primary
                    : AppColors.grey,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: CredTextStyle.bs4.copyWith(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? AppColors.primary
                    : AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrimaryFab() {
    final isSelected = currentIndex == 2;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = 2;
        });
      },
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.gradientBtn,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).cardColor,
            width: 4,
          ),
        ),
        child: Center(
          child: const Icon(
            Icons.savings_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
      ).animate(target: isSelected ? 1 : 0).scaleXY(begin: 1.0, end: 1.06, duration: 200.ms),
    );
  }
}
