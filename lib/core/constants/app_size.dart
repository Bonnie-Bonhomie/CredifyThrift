class AppSize{

  static const double padding = 15;
}

enum Frequency{
  daily('day', 'daily', 'Daily'), weekly('week', 'wk', 'Weekly'), monthly('month', 'm', 'Monthly');

  final String abbrev;
  final String name;
  final String value;

  const Frequency(this.name, this.abbrev, this.value);
}