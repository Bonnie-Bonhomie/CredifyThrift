import 'package:flutter/material.dart';

class PermissionBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback allowTap;
  final VoidCallback dontAllowTap;

  const PermissionBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.allowTap,
    required this.dontAllowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '"$title"',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5.0),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Divider(),
          Row(
            children: [
              TextButton(
                onPressed: dontAllowTap,
                child: const Text('Don`t Allow'),
              ),
              const VerticalDivider(),
              TextButton(onPressed: allowTap, child: const Text('Allow')),
            ],
          ),
        ],
      ),
    );
  }
}
