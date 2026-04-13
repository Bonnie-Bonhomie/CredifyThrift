import 'package:flutter/material.dart';

class ReuseContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  const ReuseContainer({super.key, required this.child, this.radius = 5.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Theme.of(context).cardTheme.color,
      ),
      child: child,
    );
  }
}
