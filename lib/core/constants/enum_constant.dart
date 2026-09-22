


import 'package:credify/export_barrel.dart';

enum Frequency{
  daily('day', 'daily', 'Daily'), weekly('week', 'wk', 'Weekly'), monthly('month', 'm', 'Monthly');

  final String abbrev;
  final String name;
  final String value;

  const Frequency(this.name, this.abbrev, this.value);
}

enum SavingState{
  early(AppColors.early, Icons.local_fire_department, 'Ohhh, you still have to keep up', 'Early'),
  middle(AppColors.middle, Icons.moped_sharp, 'Great, Keep moving', 'Middle'),
  complete(AppColors.complete, Icons.whatshot, 'Whooo, you are getting there', 'Complete'),
  error(AppColors.error, Icons.sensors_off, 'Oops, some error occur', 'Error');

  final Color color;
  final IconData icon;
  final String describe;
  final String name;

  const SavingState(this.color, this.icon, this.describe, this.name);
}