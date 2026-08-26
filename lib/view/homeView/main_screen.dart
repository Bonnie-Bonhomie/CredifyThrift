import 'package:credify/core/constants/app_color.dart';
import 'package:credify/view/view_export.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: _screens[currentIndex],
      floatingActionButton: primaryFab(),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(top: 5, bottom: 3),
        height: 55,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0,
        color: Theme.of(context).cardColor,
        // color: AppColors.darkGrey,
        // elevation: 20,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home_filled, 'Home', 0),
              _navItem(Icons.wifi_protected_setup_outlined, 'Activity', 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 30),
                  const SizedBox(height: 20),
                  Text(
                    'Savings',
                    style: TextStyle(
                      fontSize: 10,
                      color: currentIndex == 2
                          ? AppColors.primary
                          : Theme.of(context).textTheme.bodySmall!.color,
                    ),
                  ),
                ],
              ),
              _navItem(Icons.scale_sharp, 'Investment', 3),
              _navItem(Icons.person_3, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String title, int index) {
    final bool selected = currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selected
                    ? AppColors.lightBlue.withAlpha(50)
                    : Colors.transparent,
              ),
              child: Icon(
                icon,
                size: 20,
                color: selected
                    ? AppColors.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: selected
                    ? AppColors.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///Fab

  Widget primaryFab() {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = 2;
        });
      },
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).cardColor, width: 6),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.gradientBtn],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Icon(Icons.savings_rounded, color: Colors.white, size: 24),
      ),
    );
  }
}
