

import '../../export_barrel.dart';

class GradientProgressBar extends StatelessWidget {
  final double progress; // 0.0 - 1.0
  final Color color;

  const GradientProgressBar({
    super.key,
    required this.progress,
    this.color = AppColors.early,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.lightBlue.withAlpha(100),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color
                  // gradient: const LinearGradient(
                  //   colors: [
                  //     Colors.green,
                  //     Colors.blue,
                  //   ],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter
                  // ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}