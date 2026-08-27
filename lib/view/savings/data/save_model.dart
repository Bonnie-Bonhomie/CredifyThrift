import 'package:credify/core/constants/app_size.dart';

class SaveModel {

  String title;
  final String subtitle;
  Frequency frequency;
  double amount;
  double paidAmount;
  int percentage;
  String createdAt;
  String updatedAt;

  SaveModel({
    required this.title,
    required this.subtitle,
    required this.frequency,
    required this.createdAt,
    required this.amount,
    required this.updatedAt,
    required this.paidAmount,
    required this.percentage
});

}



