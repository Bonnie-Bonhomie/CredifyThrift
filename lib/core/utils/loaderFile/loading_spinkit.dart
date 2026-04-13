import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/app_color.dart';

class LoadingSpinKit extends StatelessWidget {
  const LoadingSpinKit({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardTheme.color
      ),
      child: SpinKitThreeBounce(
        // color: AppColors.lightBackground,
        size: 20,
        duration: Duration(milliseconds: 1500),
        itemBuilder: (context, int index){
          return DecoratedBox(decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: index == 0? AppColors.lightBackground: index == 1? AppColors.primary : AppColors.darkBlue
          ));
        },
      ),
    );
  }
}


class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildDot(double delay, Color color) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = (controller.value + delay) % 1;

        double scale = 0.5 + (value < 0.5 ? value : 1 - value);

        return Transform.scale(
          scale: 1 + scale,
          child: child,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(
          radius: 2.5,
          backgroundColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDot(0.4, AppColors.lightBackground),
        buildDot(0.2, AppColors.primary),
        buildDot(0.0, AppColors.darkBlue),
      ],
    );
  }
}