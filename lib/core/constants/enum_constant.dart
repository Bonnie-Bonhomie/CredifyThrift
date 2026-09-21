


import 'package:credify/export_barrel.dart';

enum Frequency{
  daily('day', 'daily', 'Daily'), weekly('week', 'wk', 'Weekly'), monthly('month', 'm', 'Monthly');

  final String abbrev;
  final String name;
  final String value;

  const Frequency(this.name, this.abbrev, this.value);
}

enum SavingState{
  early(AppColors.early, Icons.local_fire_department, '', 'Early'),
  middle(AppColors.middle, Icons.local_fire_department, '', 'Middle'),
  complete(AppColors.complete, Icons.local_fire_department, '', 'Complete'),
  error(AppColors.error, Icons.local_fire_department, '', 'Error');

  final Color color;
  final IconData icon;
  final String describe;
  final String name;

  const SavingState(this.color, this.icon, this.describe, this.name);
}