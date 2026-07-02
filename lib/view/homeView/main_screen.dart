import 'package:credify/core/constants/app_color.dart';
import 'package:credify/view/homeView/history_page.dart';
import 'package:credify/view/homeView/home_page.dart';
import 'package:credify/view/homeView/profile_page.dart';
import 'package:credify/view/homeView/request_page.dart';
import 'package:credify/view/homeView/scan_page.dart';
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
    RequestPageView(),
    ScanPageView(),
    HistoryPageView(),
    ProfilePageView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      floatingActionButton: primaryFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: const Color(0xff181D2D),
        elevation: 20,
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home_filled, 'Home', 0),
              _navItem(Icons.request_page_outlined, 'Request', 1),
              Column(children: const [SizedBox(width: 50), Text('Scan')]),
              _navItem(Icons.history_edu_outlined, 'History', 3),
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
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: selected ? AppColors.primary : Colors.white70),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: selected ? AppColors.primary : Colors.white70,
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
        width: 74,
        height: 74,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xff7A00FF), Color(0xff5B00E6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(.5),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 34),
      ),
    );
  }
}
